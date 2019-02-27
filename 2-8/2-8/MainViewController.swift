//
//  MainViewController.swift
//  2-8
//
//  Created by JiaLidan on 2019/2/8.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

//之前学的跳转方式 present - dismiss 独立的页面
//给一系列的页面建立一个导航栏  push - pop

class MainViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.title = "ooo"

        
    }
    
    @IBAction func toBluePage(_ sender: UIButton) {
        performSegue(withIdentifier: "toBlueSegue", sender: nil)
    }
    

    

}
