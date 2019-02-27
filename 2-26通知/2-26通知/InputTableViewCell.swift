//
//  InputTableViewCell.swift
//  2-26通知
//
//  Created by JiaLidan on 2019/2/26.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

let changeLabelText = NSNotification.Name("ChangeLabelText")

class InputTableViewCell: UITableViewCell {
    
    @IBOutlet weak var inputTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        inputTextView.layer.borderWidth = 0.5
        inputTextView.layer.borderColor = UIColor.black.cgColor
        
        inputTextView.delegate = self
        
    }

    
}
extension InputTableViewCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let text = inputTextView.text!
        if text.count == 10 {
            //发送通知
            NotificationCenter.default.post(name: changeLabelText, object: self)
            return false
        } else {
            return true
        }
    }
}
