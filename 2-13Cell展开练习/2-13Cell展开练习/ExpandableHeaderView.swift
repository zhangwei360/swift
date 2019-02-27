//
//  ExpandableHeaderView.swift
//  2-13Cell展开练习
//
//  Created by JiaLidan on 2019/2/13.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

protocol ExpandCellsDelegate {
    func expandCells()
}

class ExpandableHeaderView: UITableViewHeaderFooterView {
    
    var headerDelegate: ExpandCellsDelegate?
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 20, width: UIScreen.main.bounds.width - 40, height: 40)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .blue
        
        addSubview(titleLabel)
        
        let tapEvent = UITapGestureRecognizer(target: self, action: #selector(changeCells))
        
        self.addGestureRecognizer(tapEvent)
    }
    
    @objc func changeCells(_ sender: UITapGestureRecognizer) {
        headerDelegate?.expandCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
