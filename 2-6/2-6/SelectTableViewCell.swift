//
//  SelectTableViewCell.swift
//  2-6
//
//  Created by JiaLidan on 2019/2/6.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class SelectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var selectButton1: UIButton!
    @IBOutlet weak var selectButton2: UIButton!
    @IBOutlet weak var selectButton3: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectButton1.tag = 1
        selectButton2.tag = 2
        selectButton3.tag = 3
        
        selectButton1.addTarget(self, action: #selector(doSelect), for: .touchUpInside)
        selectButton2.addTarget(self, action: #selector(doSelect), for: .touchUpInside)
        selectButton3.addTarget(self, action: #selector(doSelect), for: .touchUpInside)

    }

    @objc func doSelect(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            selectButton1.backgroundColor = .white
            selectButton1.setTitleColor(.blue, for: .normal)
            selectButton2.backgroundColor = .blue
            selectButton2.setTitleColor(.white, for: .normal)
            selectButton3.backgroundColor = .blue
            selectButton3.setTitleColor(.white, for: .normal)
        case 2:
            selectButton1.backgroundColor = .blue
            selectButton1.setTitleColor(.white, for: .normal)
            selectButton2.backgroundColor = .white
            selectButton2.setTitleColor(.blue, for: .normal)
            selectButton3.backgroundColor = .blue
            selectButton3.setTitleColor(.white, for: .normal)
        case 3:
            selectButton1.backgroundColor = .blue
            selectButton1.setTitleColor(.white, for: .normal)
            selectButton2.backgroundColor = .blue
            selectButton2.setTitleColor(.white, for: .normal)
            selectButton3.backgroundColor = .white
            selectButton3.setTitleColor(.blue, for: .normal)
            
        default:
            break
        }
    }
    

}

