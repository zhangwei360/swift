//
//  FriendInfo.swift
//  2-8练习
//
//  Created by JiaLidan on 2019/2/8.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import Foundation

struct FriendInfo {
    var name     : String?  //姓名
    var imageName: String?  //照片姓名
    var sex      : SexType? //性别
    var wechatID : String?  //微信ID
    var location : String?  //位置
    var group    : String?  //分组
    
    init(name: String, imageName: String, sex: SexType, wechatID: String, location:String?, group: String?) {
        self.name      = name
        self.imageName = imageName
        self.sex       = sex
        self.wechatID  = wechatID
        self.location  = location
        self.group     = group
    }
}
