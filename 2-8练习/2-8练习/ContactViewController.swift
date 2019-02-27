//
//  ContactViewController.swift
//  2-8练习
//
//  Created by JiaLidan on 2019/2/8.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var friendListTableView: UITableView!
    
    var friends: [FriendInfo] = [FriendInfo(name: "Valentino Rossi",
                                            imageName: "46",
                                            sex: .Male,
                                            wechatID: "46",
                                            location: "Italy",
                                            group: "Yamaha"),
                                 FriendInfo(name: "Marc Márquez",
                                            imageName: "93",
                                            sex: .Male,
                                            wechatID: "93",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Jorge Lorenzo",
                                            imageName: "99",
                                            sex: .Male,
                                            wechatID: "99",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Andrea Dovizioso",
                                            imageName: "04",
                                            sex: .Male,
                                            wechatID: "04",
                                            location: "Italy",
                                            group: "Ducati"),
                                 FriendInfo(name: "Maverick Viñales",
                                            imageName: "25",
                                            sex: .Male,
                                            wechatID: "25",
                                            location: "Spain",
                                            group: "Yamaha")]
    
    var afriends: [FriendInfo] = [FriendInfo(name: "Marc Márquez",
                                            imageName: "93",
                                            sex: .Male,
                                            wechatID: "93",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Jorge Lorenzo",
                                            imageName: "99",
                                            sex: .Male,
                                            wechatID: "99",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Andrea Dovizioso",
                                            imageName: "04",
                                            sex: .Male,
                                            wechatID: "04",
                                            location: "Italy",
                                            group: "Ducati"),
                                 FriendInfo(name: "Maverick Viñales",
                                            imageName: "25",
                                            sex: .Male,
                                            wechatID: "25",
                                            location: "Spain",
                                            group: "Yamaha")]
    var bfriends: [FriendInfo] = [FriendInfo(name: "Valentino Rossi",
                                            imageName: "46",
                                            sex: .Male,
                                            wechatID: "46",
                                            location: "Italy",
                                            group: "Yamaha"),
                                 FriendInfo(name: "Jorge Lorenzo",
                                            imageName: "99",
                                            sex: .Male,
                                            wechatID: "99",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Andrea Dovizioso",
                                            imageName: "04",
                                            sex: .Male,
                                            wechatID: "04",
                                            location: "Italy",
                                            group: "Ducati"),
                                 FriendInfo(name: "Maverick Viñales",
                                            imageName: "25",
                                            sex: .Male,
                                            wechatID: "25",
                                            location: "Spain",
                                            group: "Yamaha")]
    var cfriends: [FriendInfo] = [FriendInfo(name: "Valentino Rossi",
                                            imageName: "46",
                                            sex: .Male,
                                            wechatID: "46",
                                            location: "Italy",
                                            group: "Yamaha"),
                                 FriendInfo(name: "Marc Márquez",
                                            imageName: "93",
                                            sex: .Male,
                                            wechatID: "93",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Andrea Dovizioso",
                                            imageName: "04",
                                            sex: .Male,
                                            wechatID: "04",
                                            location: "Italy",
                                            group: "Ducati"),
                                 FriendInfo(name: "Maverick Viñales",
                                            imageName: "25",
                                            sex: .Male,
                                            wechatID: "25",
                                            location: "Spain",
                                            group: "Yamaha")]
    var dfriends: [FriendInfo] = [FriendInfo(name: "Valentino Rossi",
                                            imageName: "46",
                                            sex: .Male,
                                            wechatID: "46",
                                            location: "Italy",
                                            group: "Yamaha"),
                                 FriendInfo(name: "Marc Márquez",
                                            imageName: "93",
                                            sex: .Male,
                                            wechatID: "93",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Jorge Lorenzo",
                                            imageName: "99",
                                            sex: .Male,
                                            wechatID: "99",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Maverick Viñales",
                                            imageName: "25",
                                            sex: .Male,
                                            wechatID: "25",
                                            location: "Spain",
                                            group: "Yamaha")]
    var efriends: [FriendInfo] = [FriendInfo(name: "Valentino Rossi",
                                            imageName: "46",
                                            sex: .Male,
                                            wechatID: "46",
                                            location: "Italy",
                                            group: "Yamaha"),
                                 FriendInfo(name: "Marc Márquez",
                                            imageName: "93",
                                            sex: .Male,
                                            wechatID: "93",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Jorge Lorenzo",
                                            imageName: "99",
                                            sex: .Male,
                                            wechatID: "99",
                                            location: "Spain",
                                            group: "Honda"),
                                 FriendInfo(name: "Andrea Dovizioso",
                                            imageName: "04",
                                            sex: .Male,
                                            wechatID: "04",
                                            location: "Italy",
                                            group: "Ducati")]
    
    var indexArray = ["O", "A", "B", "C", "D", "E"]
    
    var functionArray = ["新的朋友", "群聊", "标签", "公众号"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendListTableView.delegate = self
        friendListTableView.dataSource = self
        
        friendListTableView.tableFooterView = UIView()

        
    }
    

//    @IBAction func toEdit(_ sender: UIBarButtonItem) {
//        //能够编辑
//        friendListTableView.isEditing = true
//        friendListTableView.reloadData()
//
//    }
//

}
extension ContactViewController:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // 索引数+检索+功能部分
        return indexArray.count + 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            //搜索框
            return 1
        case 1:
            // 新的朋友 + 群聊 + 标签 + 公众号
            return 4
        case 2:
            // 好友列表
            return friends.count
        case 3:
            return afriends.count
        case 4:
            return bfriends.count
        case 5:
            return cfriends.count
        case 6:
            return dfriends.count
        case 7:
            return efriends.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            //搜索部分
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
            cell.searchTextField.delegate = self
            return cell
        case 1:
            //功能部分
            let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
            cell.nameLabel.text = functionArray[indexPath.row]
            cell.avatarImage.image = nil
            return cell
        case 2...7:
            //好友列表部分
            let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
            var targetInfo = [FriendInfo]()
            switch indexPath.section {
            case 2:
                targetInfo = friends
            case 3:
                targetInfo = afriends
            case 4:
                targetInfo = bfriends
            case 5:
                targetInfo = cfriends
            case 6:
                targetInfo = dfriends
            case 7:
                targetInfo = efriends
            default:
                break
            }
            cell.avatarImage.image = UIImage(named: targetInfo[indexPath.row].imageName!)
            cell.nameLabel.text = targetInfo[indexPath.row].name!
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            return nil
        } else {
            return indexArray[section - 2]
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            //搜索部分
            return 50
        default:
            //好友部分
            return 80
        }
    }
    //设置那些可以编辑
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.section < 2 {
//            return false
//        } else {
//            return true
//        }
//    }
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "滚犊子"
//    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        switch indexPath.section {
//        case 2:
//            friends.remove(at: indexPath.row)
//        case 3:
//            afriends.remove(at: indexPath.row)
//        case 4:
//            bfriends.remove(at: indexPath.row)
//        case 5:
//            cfriends.remove(at: indexPath.row)
//        case 6:
//            dfriends.remove(at: indexPath.row)
//        case 7:
//            efriends.remove(at: indexPath.row)
//        default:
//            break
//        }
//        //删除行
//        tableView.deleteRows(at: [indexPath], with: .left)
////        tableView.setEditing(false, animated: true)
//    }
    //设置索引显示内容
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }
    
    //关联索引和对应的section
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index + 2
    }
}

extension ContactViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        performSegue(withIdentifier: "ToSearchSegue", sender: nil)
        return false
    }
}
