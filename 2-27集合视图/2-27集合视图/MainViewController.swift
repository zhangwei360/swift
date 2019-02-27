//
//  MainViewController.swift
//  2-27集合视图
//
//  Created by JiaLidan on 2019/2/27.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let imageList:[ImageInfo] = [ImageInfo(name: "v4r",     imageName: "v4r"),
                                 ImageInfo(name: "zx10rr",  imageName: "zx10rr"),
                                 ImageInfo(name: "s1000rr", imageName: "s1000rr"),
                                 ImageInfo(name: "rsv4",    imageName: "rsv4"),
                                 ImageInfo(name: "v4r",     imageName: "v4r"),
                                 ImageInfo(name: "zx10rr",  imageName: "zx10rr"),
                                 ImageInfo(name: "s1000rr", imageName: "s1000rr"),
                                 ImageInfo(name: "rsv4",    imageName: "rsv4"),
                                 ImageInfo(name: "v4r",     imageName: "v4r"),
                                 ImageInfo(name: "zx10rr",  imageName: "zx10rr"),
                                 ImageInfo(name: "s1000rr", imageName: "s1000rr"),
                                 ImageInfo(name: "rsv4",    imageName: "rsv4")]

    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet weak var itemImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self

        
    }
    

    

}
extension MainViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = UIImage(named: imageList[indexPath.row].imageName ?? "")
        cell.textLabel.text = imageList[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = (collectionView.frame.height - 30) / 2
        let cellWidth = collectionView.frame.width - 20
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20  // 设置行的间距
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10  //设置一个图片左右的间距
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)  //设置内边距
    }
    
}
