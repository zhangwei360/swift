//
//  SingleStudent.swift
//  2-22 下载数据
//
//  Created by JiaLidan on 2019/2/24.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import Foundation
//学生信息一览内，单个学生的类型

struct SingleStudent: Decodable {
    var s_no: String?
    var name: String?
    var grade: String?
}
