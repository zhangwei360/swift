//
//  ViewController.swift
//  1-9基本控件
//
//  Created by JiaLidan on 2019/1/10.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var text: UITextField!
    
    @IBOutlet weak var imagePickerView: UIPickerView!
    
    var namePickerView = UIPickerView()
    
    var imageNames = ["s1000rr", "panigale", "rsv4"]
//    var imageNames2 = ["cbr1000rr", "YZF-R1", "GSXR1000R", "ZX-10R"]
//    var imageStyles = ["Eu", "JA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.delegate = self
        text.inputView = namePickerView
        
        namePickerView.delegate = self
        namePickerView.dataSource = self
    }

    @IBAction func button(_ sender: UIButton) {
        let result = text.text!
        if result == "" {
            label.text = "请输入"
        } else {
            label.text = result
            text.text = ""
//            switch result {
//            case "s1000rr", "bmw":
//                photo.image = UIImage(imageLiteralResourceName: "s1000rr")
//            default:
//                break
//            }
        }
    }
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        label.text = "即将进入编辑状态"
//        return false
//    }  // 干预键盘弹出
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        label.text = "正在编辑"
//    }  //只有一次
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let input = text.text!
//        label.text = input
//        return true
//    }
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        <#code#>
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        <#code#>
//    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageNames.count
//        if component == 0 {
//            return imageStyles.count
//        } else {
//            return imageNames1.count
//        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageNames[row]
//        if component == 0 {
//            return imageStyles[row]
//        } else {
//            return imageNames1[row]
//        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        photo.image = UIImage(named: imageNames[row])
        label.text = imageNames[row]
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    } // 收起键盘
}

