//
//  NewViewController.swift
//  1-29TableView列表视图
//
//  Created by JiaLidan on 2019/1/31.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var newTableView: UITableView!
    
    @IBOutlet weak var sexLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    var infos: [(name:String, imageName:String, phoneNo: String, isMarried: Bool)] = [("a", "a", "12345678", false),
                                                                                      ("b", "b", "87654321", false),
                                                                                      ("c", "c", "87651234", true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sexLabel.layer.cornerRadius = sexLabel.frame.height / 2
        sexLabel.layer.masksToBounds = true
        sexLabel.text = "男"
        nameLabel.text = "哈哈"
        
        newTableView.delegate = self
        newTableView.dataSource = self

        
    }
    


}
extension NewViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath) as! NameTableViewCell
        cell.nameLabel.text = infos[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}
