//
//  NameTableViewCell.swift
//  1-29TableView列表视图
//
//  Created by JiaLidan on 2019/1/29.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
