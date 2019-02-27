//
//  InputTableViewCell.swift
//  2-6
//
//  Created by JiaLidan on 2019/2/6.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class InputTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var inputText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }

   

}
