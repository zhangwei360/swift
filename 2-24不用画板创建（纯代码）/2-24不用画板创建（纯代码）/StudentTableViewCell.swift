//
//  StudentTableViewCell.swift
//  2-24不用画板创建（纯代码）
//
//  Created by JiaLidan on 2019/2/24.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "姓名"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gradeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "年级"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func layoutSubviews() {
        setupView()
    }

    func setupView() {
        self.contentView.addSubview(nameTitleLabel)
        self.contentView.addSubview(gradeTitleLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(gradeLabel)
        //NameTitleLabel的约束
        nameTitleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20.0).isActive = true
        nameTitleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0).isActive = true
        nameTitleLabel.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        nameTitleLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        //NameLabel的约束
        nameLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.trailingAnchor, constant: 0.0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: nameTitleLabel.topAnchor, constant: 0.0).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: nameTitleLabel.heightAnchor, multiplier: 1.0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20.0).isActive = true
        
    }
    
    

}
