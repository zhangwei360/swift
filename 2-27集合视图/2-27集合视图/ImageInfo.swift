//
//  ImageInfo.swift
//  2-27集合视图
//
//  Created by JiaLidan on 2019/2/27.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import Foundation

//照片相关的信息类型
struct ImageInfo {
    var name     : String?  //名称
    var imageName: String?  //照片名
    
    init(name:String, imageName:String) {
        self.name      = name
        self.imageName = imageName
    }
}
