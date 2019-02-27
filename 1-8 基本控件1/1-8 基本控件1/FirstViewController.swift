//
//  FirstViewController.swift
//  1-8 基本控件1
//
//  Created by JiaLidan on 2019/1/8.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var NBImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.backgroundColor = UIColor.white
        displayLabel.font = UIFont.systemFont(ofSize: 30)
        displayLabel.textColor = .blue
        displayLabel.textAlignment = .right
        displayLabel.text = "白日依山尽\n黄河入海流\n欲穷千里目\n更上一层楼"
        
        inputTextField.placeholder = "请输入文字"
        
//        NBImageView.image = UIImage(named: "kaihua") //填写图片
    }
    
    @IBAction func showInputText(_ sender: UIButton) {
        let title = inputTextField.text!
        switch title {
        case "六学", "六小龄童", "开机", "开花":
            NBImageView.image = UIImage(named: "kaihua")
        case "王境泽","真香","有骨气","境泽":
            NBImageView.image = UIImage(named: "zhenxiang")
        case "apple", "Apple","APPLE", "苹果":
            displayLabel.text = "Red\n红色"
            displayLabel.textColor = .red
        case "banana", "Banana", "BANANA", "香蕉" :
            displayLabel.text = "Yellow\n黄色"
            displayLabel.textColor = .brown
        case "" :
            displayLabel.textColor = .black
            displayLabel.text = "请输入名称"
        default:
            displayLabel.textColor = .black
            displayLabel.text = "无法判断"
        }
        inputTextField.text = ""
//        let title = sender.currentTitle!
//        displayLabel.text = title
//        let inputText = inputTextField.text!
//        displayLabel.text = inputText
//
//        inputTextField.text = ""
//        inputTextField.placeholder = "请更改文字"
//        sender.setTitle("更改", for: .selected)
//        sender.isSelected = true
    }
    

}
