//
//  StudentTableViewCell.swift
//  2-22 下载数据
//
//  Created by JiaLidan on 2019/2/24.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    var singleStudent: SingleStundentDetail?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupData() {
        nameLabel.text = singleStudent?.name
        gradeLabel.text = singleStudent?.grade
    }

}
