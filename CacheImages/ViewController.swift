//
//  ViewController.swift
//  CacheImages
//
//  Created by Trinh Thai on 10/18/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var tableView: UITableView!
    
    let urls: [String] = [
        "https://khoahocphattrien.vn/Images/Uploaded/Share/2019/03/13/dGhpZW5uaGllbg.jpg",
        "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/325466_1100-1100x628.jpg",
        "https://images5.alphacoders.com/689/689398.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRCcdS8f6L5Aonc9oUP3UfD2PAPUmqF-_IBcw&usqp=CAU",
        "https://www.sukantotanoto.com.sg/wp-content/uploads/2015/02/natuer.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSF-gjb2zxSHvKXqtJNWOfLh6M7s5mI1-MC3Q&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR8xP3udrPbaSPklwCClnSP9U7ofUi9jJsv5A&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQpnJt-7crtwtjw44tkV_X-GbpcvOP7G7gDGA&usqp=CAU",
        "https://m.economictimes.com/thumb/height-450,width-600,imgsize-1016106,msid-68721417/nature1_gettyimages.jpg",
        "https://media.gettyimages.com/photos/one-man-crossing-a-pond-in-torres-del-paine-national-park-chile-picture-id1185864506?s=612x612",
        "https://www.thinkright.me/wp-content/uploads/2019/09/Untitled-design-34.jpg",
        "https://d19lgisewk9l6l.cloudfront.net/wexas/www/images/web/experience/natural-world/north-america/north-america-natural-world.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQalnOg7X39KfF3XtALuquVniJanxZoPK8F-Q&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ1BL4hb4Mjx1kraUyYhouwrlqFVftPLzsJxQ&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTadXrlwyUuwUS12bjzOuNy4xzqLlOqVoIbjw&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQD34zuaZQSztVnitWx96Ixp7_IDZZ04anx6A&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTxW1J3itUca5KYhNigJXu_Yb31o9EYEgq13A&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTxW1J3itUca5KYhNigJXu_Yb31o9EYEgq13A&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRf1-Gc0UYbfJ-WzygxhstqAVVZLfag4gdyew&usqp=CAU",
        "https://media-cdn.tripadvisor.com/media/photo-s/0d/ee/2f/5e/peyto-lake-at-about-11am.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ImageInfo", bundle: nil), forCellReuseIdentifier: "ImageInfoCell")
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageInfoCell", for: indexPath) as! ImageInfoTableViewCell
        cell.tag = indexPath.row
        cell.configure(url: urls[indexPath.row], index: indexPath.row)
        return cell
    }
}
