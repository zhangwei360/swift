//
//  MainViewController.swift
//  2-24不用画板创建（纯代码）
//
//  Created by JiaLidan on 2019/2/24.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

let ScreenSize = UIScreen.main.bounds

class MainViewController: UIViewController {
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 64, width: ScreenSize.width - 40, height: 100)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "和老师的学生们"
        return label
    }()
    
    lazy var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 188, width: ScreenSize.width, height: ScreenSize.height - 188)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.register(StudentTableViewCell.self, forCellReuseIdentifier: "StudentCell")
        listTableView.register(UINib.init(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "newCell")
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(listTableView)

        self.view.backgroundColor = .white
    }
    

    

}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentTableViewCell
            cell.nameLabel.text = "张大海"
            return cell
        } else {
            let newCell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath) as! NewTableViewCell
            return newCell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let secondPage = SecondViewController()
            secondPage.color = UIColor.green
            self.navigationController?.pushViewController(secondPage, animated: true)
        }
    }
    
    
}
