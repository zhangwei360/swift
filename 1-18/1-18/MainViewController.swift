//
//  MainViewController.swift
//  1-18
//
//  Created by JiaLidan on 2019/1/18.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    var foodPickerView = UIPickerView()
    
    var foodArray = ["Apple", "Orange", "Banana", "Peach"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodPickerView.delegate = self
        foodPickerView.dataSource = self
        
        inputTextField.inputView = foodPickerView

            }
    
    @IBAction func showInput(_ sender: UIButton) {
        let text = inputTextField.text!
        displayLabel.text = text
        inputTextField.text = ""
    }
    
    

}
extension MainViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return foodArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return foodArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inputTextField.text = foodArray[row]
    }
}
