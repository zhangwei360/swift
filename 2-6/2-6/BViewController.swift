//
//  BViewController.swift
//  2-6
//
//  Created by JiaLidan on 2019/2/6.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    @IBOutlet weak var bLabel: UILabel!
    
    var aPage:AViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bLabel.text = aPage?.aLabel.text!
    }
    
    @IBAction func bButton(_ sender: UIButton) {
        aPage?.view.backgroundColor = .black
        dismiss(animated: true, completion: nil)
    }
    
    

}
