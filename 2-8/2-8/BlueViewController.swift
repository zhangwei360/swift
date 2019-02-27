//
//  BlueViewController.swift
//  2-8
//
//  Created by JiaLidan on 2019/2/8.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "abc"
        self.navigationItem.backBarButtonItem?.title = "ooo"
    }
    
    @IBAction func goYellow(_ sender: UIButton) {
        performSegue(withIdentifier: "toPurpleSegue", sender: nil)
    }
    
    @IBAction func goGreen(_ sender: UIButton) {
        performSegue(withIdentifier: "goGreenSegue", sender: nil)
    }
    

}
