//
//  NewViewController.swift
//  2-6
//
//  Created by JiaLidan on 2019/2/6.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    @IBOutlet weak var avatarLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var inputTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarLabel.layer.cornerRadius = avatarLabel.frame.height / 2
        avatarLabel.layer.masksToBounds = true
        avatarLabel.text = "NB"
        
        nameLabel.text = "Swift"
        
        inputTableView.delegate = self
        inputTableView.dataSource = self
        
        inputTableView.tableFooterView = UIView()  //多余的table横线不显示
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //点击空白去掉键盘
        self.view.endEditing(true)
    }

    
}
extension NewViewController:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as! InputTableViewCell
            cell.typeLabel.text = "姓名"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as! SelectTableViewCell
            cell.typeLabel.text = "性别"
            cell.selectButton1.setTitle("男", for: .normal)
            cell.selectButton2.setTitle("女", for: .normal)
            cell.selectButton3.setTitle("他", for: .normal)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as! SelectTableViewCell
            cell.typeLabel.text = "取向"
            cell.selectButton1.setTitle("男", for: .normal)
            cell.selectButton2.setTitle("女", for: .normal)
            cell.selectButton3.setTitle("他", for: .normal)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as! InputTableViewCell
            cell.typeLabel.text = "住址"
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
}
