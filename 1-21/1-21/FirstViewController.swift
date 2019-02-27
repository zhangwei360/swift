//
//  FirstViewController.swift
//  1-21
//
//  Created by JiaLidan on 2019/1/21.
//  Copyright © 2019 Zhangwei. All rights reserved.
//mvc设计模式:Model 数据层     View 视图层    Controller 视图控制器

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func toSecondPage(_ sender: UIButton) {
        performSegue(withIdentifier: "toSecondSegue", sender: nil)
    }
    
    @IBAction func toThirdPage(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  //为画面跳转准备
        if segue.identifier == "toSecondSegue" {
            let secondPageVC = segue.destination as! SecondViewController // 指定到下一个页面的
            secondPageVC.lastPageVC = self
        } else if segue.identifier == "toThirdSegue" {
            let ThirdPageVC = segue.destination as! ThirdViewController // 指定到下一个页面的
            ThirdPageVC.firstPageVC = self
        }
    }

}
