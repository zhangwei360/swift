//
//  AViewController.swift
//  2-6
//
//  Created by JiaLidan on 2019/2/6.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    @IBOutlet weak var aLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func aButton(_ sender: UIButton) {
        performSegue(withIdentifier: "AtoBSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AtoBSegue" {
            let vc = segue.destination as! BViewController
            vc.aPage = self
        }
    }

    
}
