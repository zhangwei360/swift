//
//  ThirdViewController.swift
//  1-22多画面
//
//  Created by JiaLidan on 2019/1/22.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var page3Text: UITextField!
    
    @IBOutlet weak var page3Button: UIButton!
    
    var page1VC:FirstViewController?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        page3Button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        
        page3Text.text = page1VC?.page1Text.text!

        
    }
    
    @objc func dismiss (_ sender: UIButton) {
        page1VC?.page1Text.text = page3Text.text!
        dismiss(animated: true, completion: nil)
    }
    

    

}
