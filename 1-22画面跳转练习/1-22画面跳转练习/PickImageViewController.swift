//
//  PickImageViewController.swift
//  1-22画面跳转练习
//
//  Created by JiaLidan on 2019/1/22.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class PickImageViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    
    
    var mainVC:MainViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1.image = UIImage(named: "1")
        imageView2.image = UIImage(named: "2")
        imageView3.image = UIImage(named: "3")

        
    }
    
    @IBAction func pickImage(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            mainVC?.ImageView.image = imageView1.image
        case 2:
            mainVC?.ImageView.image = imageView2.image
        case 3:
            mainVC?.ImageView.image = imageView3.image
        default:
            break
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backToMain(_ sender: UIButton) {
    }
    

}
