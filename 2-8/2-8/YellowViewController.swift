//
//  YellowViewController.swift
//  2-8
//
//  Created by JiaLidan on 2019/2/8.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backToBlue(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backToRed(_ sender: UIButton) {
        self.navigationController?.popToViewController((navigationController?.viewControllers[1])!, animated: true)
    }
    

}
