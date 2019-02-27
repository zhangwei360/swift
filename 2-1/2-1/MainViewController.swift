//
//  MainViewController.swift
//  2-1
//
//  Created by JiaLidan on 2019/2/1.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var sexText: UITextField!
    
    @IBOutlet weak var birthText: UITextField!
    
    @IBOutlet weak var nationText: UITextField!
    
    var sexPicker = UIPickerView()
    
    var birthPicker = UIPickerView()
    
    var nationPicker = UIPickerView()
    
    var sex = ["男", "女", "他"]
    
    var year = [Int]()
    
    var mouth = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var day = [Int]()
    
    var nationArray = ["China", "Japan", "USA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sexText.inputView = sexPicker
        birthText.inputView = birthPicker
        nationText.inputView = nationPicker
        
        sexPicker.delegate = self
        sexPicker.dataSource = self
        
        birthPicker.delegate = self
        birthPicker.dataSource = self
        
        nationPicker.delegate = self
        nationPicker.dataSource = self
        
        for i in 1900...2019 {
            year.append(i)
        }
        for i in 1...31 {
            day.append(i)
        }


        
    }
    

    

}
extension MainViewController:UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case sexPicker:
            return 1
        case birthPicker:
            return 3
        case nationPicker:
            return 1
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case sexPicker:
            return sex.count
        case birthPicker:
            switch component {
            case 0:
                return year.count
            case 1:
                return mouth.count
            case 2:
                return day.count
            default:
                return 1
            }
        case nationPicker:
            return nationArray.count
        default:
            return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case sexPicker:
            return sex[row]
        case birthPicker:
            switch component {
            case 0:
                return "\(year[row])"
            case 1:
                return "\(mouth[row])"
            case 2:
                return "\(day[row])"
            default:
                return ""
            }
        case nationPicker:
            return nationArray[row]
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case sexPicker:
            return sexText.text = sex[row]
        case birthPicker:
            return birthText.text = "\(year[row])"
        case nationPicker:
            return nationText.text = nationArray[row]
        default:
            break
        }
    }
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

