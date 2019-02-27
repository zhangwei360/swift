//
//  SecondViewController.swift
//  1-21
//
//  Created by JiaLidan on 2019/1/21.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var display2: UILabel!
    
    @IBOutlet weak var inputText2: UITextField!
    
    var textFromFirst = ""
    
    var lastPageVC: FirstViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        display2.text = textFromFirst
        display2.text = lastPageVC?.inputText.text
        
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        lastPageVC?.inputText.text = inputText2.text
        dismiss(animated: true, completion: nil)
    }
    
    

}
