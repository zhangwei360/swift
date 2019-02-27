//
//  PurpleViewController.swift
//  2-8
//
//  Created by JiaLidan on 2019/2/8.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class PurpleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func toYellow(_ sender: UIButton) {
        performSegue(withIdentifier: "toYellowSegue", sender: nil)
    }
    
    

}
