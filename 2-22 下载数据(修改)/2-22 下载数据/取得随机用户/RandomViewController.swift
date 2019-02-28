//
//  RandomViewController.swift
//  2-22 下载数据
//
//  Created by JiaLidan on 2019/2/22.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

struct UserInfo {
    var name: String?
    var gender : String?
    var email: String?
    var avatorUrl: String?
}

class RandomViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var infoTableView: UITableView!
    
    var address = "https://randomuser.me/api/"
    
    var singleInfo: UserInfo?
    
    var session:URLSession?

    var isLoading = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = URLSession(configuration: .default)
        
        singleInfo = UserInfo()
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        
        let tapEvent = UITapGestureRecognizer(target: self, action: #selector(changeUser))
        avatarImageView.addGestureRecognizer(tapEvent)
        avatarImageView.isUserInteractionEnabled = true
        
        downloadInfo()

        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.layer.masksToBounds = true
    }
    
    func downloadInfo() {
        if let url = URL(string: address) {
            let task = session?.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    self.isLoading = false
                    return
                }
                if let downloadData = data {
                    do {
                        let resultData = try JSONDecoder().decode(DownloadData.self, from: downloadData)
                        let firstName = resultData.results?[0].name?.first
                        let lastName = resultData.results?[0].name?.last
                        let fullName: String? = {
                            guard let realFirstName = firstName, let realLastName = lastName
                                else { return nil }
                            return realFirstName + " " + realLastName
                        }()
                        self.singleInfo?.name = fullName
                        self.singleInfo?.email = resultData.results?[0].email
                        self.singleInfo?.gender = resultData.results?[0].gender
                        if let realUrl = resultData.results?[0].picture?.large {
                            self.downloadImage(url: realUrl)
                        }
                        DispatchQueue.main.async(execute: {
                            self.infoTableView.reloadData()
                        })
                        
                    } catch {
                        print(error.localizedDescription)
                        self.isLoading = false
                    }
                    
                }
//                if let downloadData = data {
//                    do {
//                        let json = try JSONSerialization.jsonObject(with: downloadData, options: [])
//                        self.parseJson(downloadInfo: json)
//                        DispatchQueue.main.async(execute: {
//                            self.infoTableView.reloadData()
//                        })
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//
//                }
            })
            task?.resume()
            isLoading = true
        }
    }
    
    @objc func changeUser (_ sender: UITapGestureRecognizer) {
        if !isLoading {
            downloadInfo()
        }

    }
    
//    func parseJson(downloadInfo: Any?) {
//        if let json = downloadInfo as? [String: Any] {
//            if let infoArray = json["results"] as? [[String: Any]] {
//                let infoDict = infoArray[0]
//                singleInfo?.email = infoDict["email"] as? String
//                singleInfo?.gender = infoDict["gender"] as? String
//                if let nameDict = infoDict["name"] as? [String: String] {
//                    let firstName = nameDict["first"] ?? ""
//                    let lastName = nameDict["last"] ?? ""
//                    singleInfo?.name = firstName + " " + lastName
//                }
//                if let singlePicture = infoDict["picture"] as? [String: String] {
//                    if let imageUrl = singlePicture["large"] {
//                        downloadImage(url: imageUrl)
//                    }
//                }
//            }
//        }
//    }
    
    func downloadImage (url: String) {
        if let imageUrl = URL(string: url) {
                        let task = session?.dataTask(with: imageUrl, completionHandler: { (data, response, error) in
                            if error != nil {
                                print(error!.localizedDescription)
                                self.isLoading = false
                                return
                            }
                            if let downloadData = data {
                                let downloadImage = UIImage(data: downloadData)
                                //回到主线程
                                DispatchQueue.main.async{
                                    self.avatarImageView.image = downloadImage
                                    self.isLoading = false
                                }
                            }
                        })
                        task?.resume() //执行任务
        }
    }
}
extension RandomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "姓名"
            cell.infoLabel.text = self.singleInfo?.name
        case 1:
            cell.titleLabel.text = "性别"
            cell.infoLabel.text = self.singleInfo?.gender
        case 2:
            cell.titleLabel.text = "email"
            cell.infoLabel.text = self.singleInfo?.email
        default:
            break
        }
        return cell
    }
}

