//
//  FirstViewController.swift
//  1-21多画面练习
//
//  Created by JiaLidan on 2019/1/21.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var sexTextField: UITextField!
    
    @IBOutlet weak var birthTextField: UITextField!
    
    @IBOutlet weak var nationTextField: UITextField!
    
    var sexPickerView = UIPickerView()
    var birthPickerView = UIPickerView()
    var nationPickerView = UIPickerView()
    
    var sexData = ["男","女","其他"]
    var birthYearData = [String]()
    var birthMouthData = [String]()
    var nationData = ["日本","中国大陆","其他"]
    var year:Int = 2019
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sexTextField.inputView = sexPickerView
        birthTextField.inputView = birthPickerView
        nationTextField.inputView = nationPickerView
        
        sexPickerView.delegate = self
        sexPickerView.dataSource = self
        
        birthPickerView.delegate = self
        birthPickerView.dataSource = self
        
        nationPickerView.delegate = self
        nationPickerView.dataSource = self

        
    }
    
    func setBirthData() {
        for i in 1950...year {
            birthYearData.append("\(i)")
        }
        for i in 1...12 {
            birthMouthData.append("\(i)")
        }
    }
    
    @IBAction func showInfos(_ sender: UIButton) {
        
    }
    
    

}
extension FirstViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case sexPickerView:
            return 1
        case birthPickerView:
            return 2
        case nationPickerView:
            return 1
        default:
            return 0
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case sexPickerView:
            return sexData.count
        case birthPickerView:
            return 
        default:
            <#code#>
        }
    }
    
    
}
