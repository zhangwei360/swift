//
//  ViewController.swift
//  2-26通知
//
//  Created by JiaLidan on 2019/2/26.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var inputTableView: UITableView!
    
    var array = ["asdfghjghcfvhbhgtfdrgfcgvhbkjuigyftdfgchvhbkjhuigyftdrtgfcgvhkuigyftdrgfcgvhjgffjgkl;ikuytrefesdf",
                 "guijkbhgugyhuoijlyuufyghjiuo8utyrdtfghuiyutyrdedxgfchvjkuiutydrtxgghbkuigyuftyfchgv",
                 "utyghiouytfghthugyfcghvjbkuigyftdrgfchgvjkuiygftychgvhjbkjuigyftfchgvhbiuiytresdfghuijhufgxdfcvhbyresdftuytfgghjknmbnvhfguuuiuyfgcvbjhjutyfgfhgugfgvh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "请继续输入"
        
        inputTableView.delegate = self
        inputTableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeLabel), name: changeLabelText, object: nil)
        
        
    }
    deinit {  //移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func changeLabel() {
        countLabel.text = "不能再输入了"
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell", for: indexPath) as! InputTableViewCell
            return cell
        } else {
            let cell = UITableViewCell()
            cell.textLabel!.numberOfLines = 0
            cell.textLabel!.text = array[indexPath.row - 1]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10  //估算一个高度值
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else {
            return UITableView.automaticDimension //根据文字自动调节高度
        }
    }
    
    
}
