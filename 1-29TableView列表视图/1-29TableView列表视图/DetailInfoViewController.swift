//
//  DetailInfoViewController.swift
//  1-29TableView列表视图
//
//  Created by JiaLidan on 2019/1/29.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class DetailInfoViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    
    
    var singleInfo: (name:String, image:String, phone:String, isMarry:Bool) = ("", "", "", false)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
