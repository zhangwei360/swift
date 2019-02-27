//
//  FoodTableViewCell.swift
//  2-2画面复习
//
//  Created by JiaLidan on 2019/2/2.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var formLabel: UILabel!
    
    @IBOutlet weak var foodLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
