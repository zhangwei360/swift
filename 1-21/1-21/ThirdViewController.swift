//
//  ThirdViewController.swift
//  1-21
//
//  Created by JiaLidan on 2019/1/21.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var firstPageVC:FirstViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch firstPageVC?.inputText.text! {
        case "红":
            self.view.backgroundColor = .red
        case "绿":
            self.view.backgroundColor = .green
        case "蓝":
            self.view.backgroundColor = .blue
        default:
            break
        }

        
    }
    
    @IBAction func backToPage1(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
   

}
