//
//  SearchViewController.swift
//  2-8练习
//
//  Created by JiaLidan on 2019/2/12.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var movingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(back))
        movingView.addGestureRecognizer(tap)
        movingView.isUserInteractionEnabled = true

        
    }
    
    @objc func back(_ sender:UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //输入框和按键所在的View整体上移
        UIView.animate(withDuration: 1, animations: {
            self.movingView.frame.origin.y -= 30
            self.movingView.alpha = 1
            self.movingView.backgroundColor = .red
            })
    }
    

    

}
