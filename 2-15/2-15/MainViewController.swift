//
//  MainViewController.swift
//  2-15
//
//  Created by JiaLidan on 2019/2/15.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit
//可乐 200 豆浆 100 咖啡 180 红牛 300 红茶 190   1-10 冷热 小中大 加冰
class MainViewController: UIViewController {
    
    var drink = [("可乐", 200), ("豆浆", 100), ("咖啡", 180), ("红牛", 300), ("红茶", 190)]
    
    var num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    @IBOutlet weak var size1: UIButton!
    
    @IBOutlet weak var size2: UIButton!
    
    @IBOutlet weak var size3: UIButton!
    
    @IBOutlet weak var ice1: UIButton!
    
    @IBOutlet weak var ice2: UIButton!
    
    @IBOutlet weak var ice3: UIButton!
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var drinkText: UITextField!
    
    @IBOutlet weak var numText: UITextField!
    
    @IBOutlet weak var isHot: UISwitch!
    
    @IBOutlet weak var iceLabel: UILabel!
    
    
    var drinkPicker = UIPickerView()
    
    var numPicker = UIPickerView()
    
    var drinkResult = ""
    
    var numResult = 0
    
    var hotResult = ""
    
    var sizeResult = ""
    
    var iceResult = ""
    
    var priceResult = 0
    
    var totalResult = ""
    
    var price2 = 0
    
    var priceChanged = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinkText.inputView = drinkPicker
        numText.inputView = numPicker
        
        drinkPicker.delegate = self
        drinkPicker.dataSource = self
        numPicker.delegate = self
        numPicker.dataSource = self
        
        numText.isEnabled = false
        size1.isEnabled = false
        size2.isEnabled = false
        size3.isEnabled = false
        
        ice1.isEnabled = false
        ice2.isEnabled = false
        ice3.isEnabled = false
        
        isHot.isOn = false
        isHot.isEnabled = false
        isHot.addTarget(self, action: #selector(isHotSwitch), for: .valueChanged)
        
        size1.addTarget(self, action: #selector(sizeChange), for: .touchUpInside)
        size2.addTarget(self, action: #selector(sizeChange), for: .touchUpInside)
        size3.addTarget(self, action: #selector(sizeChange), for: .touchUpInside)
        
        ice1.addTarget(self, action: #selector(iceChanged), for: .touchUpInside)
        ice2.addTarget(self, action: #selector(iceChanged), for: .touchUpInside)
        ice3.addTarget(self, action: #selector(iceChanged), for: .touchUpInside)
        
    }
    @ objc func sizeChange(_ sender: UIButton) {
        if size3.isHidden {
            switch sender.tag {
            case 1:
                sizeResult = "小杯"
                priceChanged = priceResult
            case 2:
                sizeResult = "中杯"
                priceChanged = priceResult * 2
            default:
                break
            }
        } else {
            switch sender.tag {
            case 1:
                sizeResult = "小杯"
                priceChanged = priceResult / 2
            case 2:
                sizeResult = "中杯"
                priceChanged = priceResult
            case 3:
                sizeResult = "大杯"
                priceChanged = priceResult * 2
            default:
                break
            }
            price2 = priceChanged
        }
        price()
        realdisplay(displayDrink: drinkResult, displayNum: numResult, displayHot: hotResult, displaySize: sizeResult, displayIce: iceResult, totalPrice: totalResult)
    }
    
    @objc func iceChanged(_ sender: UIButton){
        if !isHot.isOn {
            switch sender.tag {
            case 1:
                iceResult = "不加冰"
                priceChanged = price2 - 20
            case 2:
                iceResult = "少冰"
                priceChanged = price2 - 10
            case 3:
                iceResult = "普通"
                priceChanged = price2
            default:
                break
            }
        }
        price()
        realdisplay(displayDrink: drinkResult, displayNum: numResult, displayHot: hotResult, displaySize: sizeResult, displayIce: iceResult, totalPrice: totalResult)

    }
    func price () {
        totalResult = "价格：\(numResult * priceChanged)"
    }
    
    func realdisplay (displayDrink: String, displayNum: Int, displayHot: String, displaySize: String, displayIce: String, totalPrice: String) {
        display.text = "饮料：\(displayDrink)\n数量：\(displayNum)\n\(displayHot) \(displaySize) \(displayIce)\n\(totalPrice)"
    }
    
    @objc func isHotSwitch () {
        switch drinkResult {
        case "可乐", "红牛":
            hotResult = "冷饮"
            isHot.isEnabled = false
        case "":
            hotResult = ""
        default:
            if isHot.isOn {
                hotResult = "热饮"
                size3.isHidden = true
                ice1.isHidden = true
                ice2.isHidden = true
                ice3.isHidden = true
                iceLabel.isHidden = true
            } else {
                hotResult = "冷饮"
                size3.isHidden = false
                ice1.isHidden = false
                ice2.isHidden = false
                ice3.isHidden = false
                iceLabel.isHidden = false
            }
        }
        price()
        realdisplay(displayDrink: drinkResult, displayNum: numResult, displayHot: hotResult, displaySize: sizeResult, displayIce: iceResult, totalPrice: totalResult)

    }
    
    
    
    

}
extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == drinkPicker {
            return drink.count
        } else {
            return num.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == drinkPicker {
            return drink[row].0
        } else {
            return "\(num[row])"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == drinkPicker {
            size1.isEnabled = true
            size2.isEnabled = true
            size3.isEnabled = true
            ice1.isEnabled = true
            ice2.isEnabled = true
            ice3.isEnabled = true
            numText.isEnabled = true
            isHot.isEnabled = true
            drinkText.text = drink[row].0
            drinkResult = drink[row].0
            numText.text = ""
            numResult = 1
            hotResult = ""
            sizeResult = "中杯"
            iceResult = "普通"
            totalResult = ""
            priceResult = drink[row].1
            priceChanged = priceResult
            if drink[row].0 == "可乐" || drink[row].0 == "红牛" {
                isHot.isEnabled = false
            }
            price()
            realdisplay(displayDrink: drinkResult, displayNum: numResult, displayHot: hotResult, displaySize: sizeResult, displayIce: iceResult, totalPrice: totalResult)

        } else {
            numText.text = "\(num[row])"
            numResult = num[row]
            price()
            realdisplay(displayDrink: drinkResult, displayNum: numResult, displayHot: hotResult, displaySize: sizeResult, displayIce: iceResult, totalPrice: totalResult)

            
        }
    }
}
