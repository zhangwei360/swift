//
//  ViewController.swift
//  CameraPJ
//
//  Created by WANG on 2018/10/19.
//  Copyright © 2018年 WANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedText = UserDefaults.standard.value(forKey: "inputText") as? String
        myLabel.text = savedText
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        //UserDefaults
        let text = myTextField.text!
        
        //多级存储
        var strArray = UserDefaults.standard.value(forKey: "inputText") as? [String]
        if strArray != nil {
            strArray?.append(text)
        } else {
            strArray = [text]
        }
        
        UserDefaults.standard.set(strArray, forKey: "inputText")
        //立即储存。新版本不需要
        UserDefaults.standard.synchronize()
        
        myLabel.text = myTextField.text
        myTextField.text = ""
        
        //清空
        UserDefaults.standard.removeObject(forKey: "inputText")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

