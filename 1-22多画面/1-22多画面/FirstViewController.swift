//
//  FirstViewController.swift
//  1-22多画面
//
//  Created by JiaLidan on 2019/1/22.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var toNextPage: UIButton!
    
    @IBOutlet weak var page1Text: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toNextPage.addTarget(self, action: #selector(goToNext), for: .touchUpInside)

        
    }
    override func viewWillAppear(_ animated: Bool) {  //画面即将出现
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {  //画面已经出现
        super.viewDidAppear(animated)
    }
    override func viewWillLayoutSubviews() {  //画面即将开始加载子视图
        super.viewWillLayoutSubviews()
    }
    override func viewDidLayoutSubviews() {  //画面已经加载子视图
        super.viewDidLayoutSubviews()
    }
    override func viewWillDisappear(_ animated: Bool) { //画面即将消失
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) { //画面已经消失
        super.viewDidDisappear(animated)
    }
    
//    @IBAction func toPage2(_ sender: UIButton) {
//        performSegue(withIdentifier: "toSecondPage", sender: nil)
//    }
    @objc func goToNext(_ sender: UIButton) {
        performSegue(withIdentifier: "toSecondPage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondPage" {
            let page2VC = segue.destination as! SecondViewController
            page2VC.page1VC = self
            
        } else if segue.identifier == "toThirdPage" {
            let page3VC = segue.destination as! ThirdViewController
            page3VC.page1VC = self
        }
        
            
        
    }
    

}
