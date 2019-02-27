//
//  SingleStudentViewController.swift
//  2-22 下载数据
//
//  Created by JiaLidan on 2019/2/25.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class SingleStudentViewController: UIViewController {
    
    @IBOutlet weak var inputNameTextField: UITextField!
    
    @IBOutlet weak var inputGradeTextField: UITextField!
    
    @IBOutlet weak var inputBirthTextField: UITextField!
    
    @IBOutlet weak var inputPhoneTextField: UITextField!
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 400, width: 80, height: 30)
        button.setTitle("返回", for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 120, y: 400, width: 80, height: 30)
        button.setTitle("编辑", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(backButton)
        self.view.addSubview(editButton)
        
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(edit), for: .touchUpInside)
    }
    @objc func back (_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @objc func edit (_ sender: UIButton) {
        
    }
    
}
