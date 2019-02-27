//
//  ViewController.swift
//  2-22 下载数据
//
//  Created by JiaLidan on 2019/2/22.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testImageView: UIImageView!
    
    var session: URLSession?
    
    let webUrl = "https://image.shutterstock.com/image-vector/abc-letter-chart-450w-170331863.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = URLSession(configuration: .default)
        //session自动到线程上
        
        if let imageUrl = URL(string: webUrl) {
            let task = session?.downloadTask(with: imageUrl, completionHandler: { (url, response, error) in
                if error != nil {
                    let errCode = (error! as NSError).code
                    if errCode == -1009 {
                        //没有网络时弹出警告试图
                        let alertView = UIAlertController(title: "网络连接失败", message: "<#T##String?#>", preferredStyle: .alert)
                        self.present(alertView, animated: true, completion: {
                            //2秒后自动消失
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                                alertView.dismiss(animated: true, completion: nil)
                            })
                        })
                    } else {
                        print(errCode)
                    }
//                    print(error!.localizedDescription)
                    return
                }
                if let downloadUrl = url {
                    do {
                        let loadedData = try Data(contentsOf: downloadUrl)
                        let downloadImage = UIImage(data: loadedData)
                        DispatchQueue.main.async{
                            self.testImageView.image = downloadImage
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
            })
            task?.resume()
        
//        if let imageUrl = URL(string: webUrl) {
//            let task = session?.dataTask(with: imageUrl, completionHandler: { (data, response, error) in
//                if error != nil {
//                    print(error!.localizedDescription)
//                    return
//                }
//                if let downloadData = data {
//                    let downloadImage = UIImage(data: downloadData)
//                    //回到主线程
//                    DispatchQueue.main.async{
//                        self.testImageView.image = downloadImage
//                    }
//                }
//            })
//            task?.resume() //执行任务
        }
        
        
        
        
        
//        if let imageUrl = URL(string: webUrl) {
//            //不重要 费时间的加载放到主线程以外的线程
//            DispatchQueue.global().async(execute: {
//                do {
//                    let downloadImage =  UIImage(data: try Data(contentsOf: imageUrl))
//                    //取得图片后 画面再次回到主线程
//                    DispatchQueue.main.async(execute: {
//                        self.testImageView.image = downloadImage
//                    })
//                } catch {
//                    print(error.localizedDescription)
//                }
//                })
//        }
        
    }


}

