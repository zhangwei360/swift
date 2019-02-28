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
    
    var singleStundentDetail: SingleStundentDetail?
    
    var postUrl_getAll = "/addStudent"
    
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
        button.setTitle("添加", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputNameTextField.text = singleStundentDetail?.name
        inputGradeTextField.text = singleStundentDetail?.grade
        inputBirthTextField.text = singleStundentDetail?.birthday
        inputPhoneTextField.text = singleStundentDetail?.phone_number
        
        self.view.addSubview(backButton)
        self.view.addSubview(editButton)
        
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(edit), for: .touchUpInside)
    }
    @objc func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func edit(_ sender: UIButton) {
//        let strUrl = "http://www.kinwork.jp:7775/LearnApi/addStudent"
//        if let url = URL(string: strUrl) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            let itemStr = "name=\(inputNameTextField.text!)&grade=\(inputGradeTextField.text!)&birthday=\(inputBirthTextField.text!)&phone_number=\(inputPhoneTextField.text!)"
//            let paraData = itemStr.data(using: String.Encoding.utf8)
//            request.httpBody = paraData
//        }
        
        var paraDict = ["name": inputNameTextField.text!,
                        "grade": inputGradeTextField.text!,
                        "birthday": inputBirthTextField.text!,
                        "phone_number": inputPhoneTextField.text!]

            let strUrl = host + postUrl_getAll
            var postClass = PostClass()
//            postClass.deleagte = self
            postClass.getData(strUrl: strUrl, type: .AddOne, para: paraDict)
        
    }
}
