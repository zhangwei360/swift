//
//  SecondViewController.swift
//  1-22多画面
//
//  Created by JiaLidan on 2019/1/22.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var page2Text: UITextField!
    
    
    @IBOutlet weak var toFirstPage: UIButton!
    
    var page1VC:FirstViewController?
    
    var programData = ["Swift", "Php", "Ruby", "C#"]
    var foodData = ["蒸羊羔", "蒸熊掌", "蒸鲁尾"]
    var page2PickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        page2Text.text = page1VC?.page1Text.text!
        
        toFirstPage.addTarget(self, action: #selector(toFirst), for: .touchUpInside)
        page2Text.inputView = page2PickerView
        
        page2PickerView.delegate = self
        page2PickerView.dataSource = self
        

        
    }
    
    @objc func toFirst (_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        page1VC?.page1Text.text = page2Text.text!
    }
    

    

}
extension SecondViewController:UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return programData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return programData[row]
    }
}
