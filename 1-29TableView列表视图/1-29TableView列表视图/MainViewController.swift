//
//  MainViewController.swift
//  1-29TableView列表视图
//
//  Created by JiaLidan on 2019/1/29.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textLebal: UILabel!
    
    @IBOutlet weak var swicth: UISwitch!
    
    let text = "好消息,\n好消息。"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLebal.numberOfLines = 0
        textLebal.text = text
        
        swicth.addTarget(self, action: #selector(changeLabelStyle), for: .valueChanged)
        
        if swicth.isOn {
            textLebal.backgroundColor = .black
            textLebal.textColor = .white
        } else {
            textLebal.backgroundColor = .white
            textLebal.textColor = .black
        }

        
    }
    
    @objc func changeLabelStyle(_ sender: UISwitch) {
//        if sender.isOn {
//            textLebal.backgroundColor = .black
//            textLebal.textColor = .white
//        } else {
//            textLebal.backgroundColor = .white
//            textLebal.textColor = .black
//        }
        textLebal.backgroundColor = swicth.isOn ? .black : .white
        textLebal.textColor = swicth.isOn ? .white : .black
    }

    

}
