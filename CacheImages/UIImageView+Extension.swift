//
//  UIImageView+Extension.swift
//  CacheImages
//
//  Created by Trinh Thai on 10/18/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

extension UIImageView {
    static let imageCache = NSCache<AnyObject, AnyObject>()
    
    func cacheImage(imageUrlString: String) {
        if let imageFromCache = UIImageView.imageCache.object(forKey: imageUrlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        guard let url = URL(string: imageUrlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                if let imageToCache = UIImage(data:data) {
                    self.image = imageToCache
                    UIImageView.imageCache.setObject(imageToCache, forKey: imageUrlString as AnyObject)
                }
            }
        }.resume()
    }
    
    func downloadImage(imageUrlString: String, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        if let imageFromCache = UIImageView.imageCache.object(forKey: imageUrlString as AnyObject) as? UIImage {
            completion(imageFromCache, nil)
            return
        }
        
        guard let url = URL(string: imageUrlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            
            DispatchQueue.main.async {
                if let data = data, let imageToCache = UIImage(data:data) {
                    UIImageView.imageCache.setObject(imageToCache, forKey: imageUrlString as AnyObject)
                    completion(imageToCache, nil)
                }
            }
        }.resume()
    }
}

