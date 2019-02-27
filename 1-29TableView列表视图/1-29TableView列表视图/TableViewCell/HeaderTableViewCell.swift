//
//  HeaderTableViewCell.swift
//  1-29TableView列表视图
//
//  Created by JiaLidan on 2019/1/29.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var headerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headerButton.layer.cornerRadius = headerButton.frame.height / 2
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
