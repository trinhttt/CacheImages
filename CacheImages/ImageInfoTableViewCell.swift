//
//  ImageInfoTableViewCell.swift
//  CacheImages
//
//  Created by Trinh Thai on 10/18/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class ImageInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var ibImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(url: String, index: Int) {
        
        //// WAY 1: OK BUT DOWNLOAD IMAGE IMAGE AGAIN WHEN SCROLL
//                DispatchQueue.global().async {
//                    guard let url = URL(string: url) else { return }
//                    do {
//                        let data = try Data(contentsOf: url)
//                        DispatchQueue.main.async {
//                            if self.tag == index {
//                                self.ibImage.image = UIImage(data: data)
//                            }
//                        }
//                    } catch {
//                        print(error)
//                    }
//                }
//
        //// WAY 2: WRONG, DO NOT CHECK cell.tag == indexPath.row before set image
//        self.ibImage.image = UIImage()
//        self.ibImage.cacheImage(imageUrlString: url)

        ////WAY3: PERFECT:
        self.ibImage.image = UIImage()
        let imageView = UIImageView()
        imageView.downloadImage(imageUrlString: url) { (image, error) in
            
            guard error == nil else {
                self.ibImage.image = nil
                return
            }
            
            guard let image = image else { return }
            
            if self.tag == index {
                self.ibImage.image = image
            }
        }
    }
}
