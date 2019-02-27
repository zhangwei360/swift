//
//  UserInfo.swift
//  2-22 下载数据
//
//  Created by JiaLidan on 2019/2/24.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import Foundation

struct DownloadData: Decodable {
    var results: [SingleData]?
    
}

struct SingleData: Decodable {
    var gender: String?
    var name: NameData?
    var email: String?
    var picture: PictureData?
}

struct NameData: Decodable {
    var first: String?
    var last: String?
}

struct PictureData: Decodable {
    var large: String?
}
//通讯类型 post(有往返) get（只得到）

