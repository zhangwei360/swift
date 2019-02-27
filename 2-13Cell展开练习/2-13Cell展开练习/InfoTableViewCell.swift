//
//  InfoTableViewCell.swift
//  2-13Cell展开练习
//
//  Created by JiaLidan on 2019/2/13.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var borderLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var row: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderLabel.layer.cornerRadius = 5
        borderLabel.layer.masksToBounds = true
        
        borderLabel.layer.borderWidth = 0.5
        borderLabel.layer.borderColor = UIColor.blue.cgColor
        
        detailLabel.numberOfLines = 0
        
    }
    func setupData() {
        nameLabel.text = friendInfos[row!].name
        addressLabel.text = friendInfos[row!].address
        var detail = ""
        for i in 0...friendInfos[row!].details.count - 1 {
            detail += friendInfos[row!].details[i]
            detail += "\n"
        }
        detailLabel.text = detail
    }


}
