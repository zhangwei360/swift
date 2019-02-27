//
//  MainTableViewController.swift
//  1-29TableView列表视图
//
//  Created by JiaLidan on 2019/1/29.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var infos: [(name:String, imageName:String, phoneNo: String, isMarried: Bool)] = [("a", "a", "12345678", false),
                                                                                      ("b", "b", "87654321", false),
                                                                                      ("c", "c", "87651234", true)]

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
//        return 5
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return 5
//        case 1:
//            return 10
//        case 2:
//            return 15
//        case 3:
//            return 20
//        case 4:
//            return 25
//        default:
//            return 0
        
        
//        }
        return infos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! NameTableViewCell
//        cell.nameLabel.text = "同学\(indexPath.row + 1)"
        cell.nameLabel.text = infos[indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 60
        } else {
            return 30
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section + 1)年级"
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    



}
