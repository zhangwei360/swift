//
//  MainViewController.swift
//  1-22画面跳转练习
//
//  Created by JiaLidan on 2019/1/22.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func toPick(_ sender: UIButton) {
        performSegue(withIdentifier: "toPickImageSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPickImageSegue" {
            let nextVC = segue.destination as! PickImageViewController
            nextVC.mainVC = self
            
        }
    }

}
