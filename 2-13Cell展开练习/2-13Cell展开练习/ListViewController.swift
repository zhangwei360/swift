//
//  ListViewController.swift
//  2-13Cell展开练习
//
//  Created by JiaLidan on 2019/2/13.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

let friendInfos: [(name: String, address: String, details:[String])] = [("长者", "八宝山",["Too Young Too Simple","Ha","Sometimes Naive"]), ("Hu", "八宝山", ["barongbachi", "hahaha", "shenme"]), ("laowang", "八宝山",["asd","qwe", "zxc"]), ("长者", "八宝山",["Too Young Too Simple","Ha","Sometimes Naive"]), ("Hu", "八宝山", ["barongbachi", "hahaha", "shenme"]), ("laowang", "八宝山",["asd","qwe", "zxc"]), ("长者", "八宝山",["Too Young Too Simple","Ha","Sometimes Naive"]), ("Hu", "八宝山", ["barongbachi", "hahaha", "shenme"]), ("laowang", "八宝山",["asd","qwe", "zxc"]), ("长者", "八宝山",["Too Young Too Simple","Ha","Sometimes Naive"]), ("Hu", "八宝山", ["barongbachi", "hahaha", "shenme"]), ("laowang", "八宝山",["asd","qwe", "zxc"]), ("长者", "八宝山",["Too Young Too Simple","Ha","Sometimes Naive"]), ("Hu", "八宝山", ["barongbachi", "hahaha", "shenme"]), ("laowang", "八宝山",["asd","qwe", "zxc"]),("长者", "八宝山",["Too Young Too Simple","Ha","Sometimes Naive"]), ("Hu", "八宝山", ["barongbachi", "hahaha", "shenme"]), ("laowang", "八宝山",["asd","qwe", "zxc"])]


class ListViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    var isExpanded = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.layer.masksToBounds = true
        
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        
        avatarImageView.image = UIImage(named: "bao")
        nameLabel.text = "weinixiong"
        detailLabel.text = "daoche"

        
    }
    

    

}
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
        cell.row = indexPath.row
        cell.setupData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isExpanded {
            return 120
        } else {
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let myView = UIView()
//        //代码建Label
//        let subLabel:UILabel = {
//            let label = UILabel()
//            label.frame = CGRect(x: 10, y: 10, width: 60, height: 20)
//            label.backgroundColor = .green
//            label.text = "Test"
//            return label
//        }()
//
//        myView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80)
//        myView.backgroundColor = .red
//        myView.addSubview(subLabel) //添加子视图
//        return myView
        let headerView = ExpandableHeaderView()
        headerView.headerDelegate = self
        
        headerView.titleLabel.text = "第\(section + 1)个Section"
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
}
extension ListViewController: ExpandCellsDelegate {
    func expandCells() {
        isExpanded = !isExpanded
//        friendsTableView.reloadData() //整体刷新
        // 逐行刷新
        friendsTableView.beginUpdates()
        
        for i in 0...friendInfos.count - 1 {
            friendsTableView.reloadRows(at: [IndexPath(row: i, section: 0)], with: .automatic)
        }
            
        friendsTableView.endUpdates()
        
    }
    
    
}
