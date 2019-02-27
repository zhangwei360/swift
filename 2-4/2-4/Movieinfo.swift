//
//  Movieinfo.swift
//  2-4
//
//  Created by JiaLidan on 2019/2/4.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import Foundation

struct MovieInfo {
    var movieNo: Int?
    var name: String?
    var imageName: String?
    var type: String?
    var length: Int?
    var is3D: Bool?
    var schedule: [(theaterNo: Int, time: String)] = []
    var price: Int?
    
    init(movieNo: Int, name: String, imageName: String, type: String, length: Int, is3D: Bool) {
        self.movieNo = movieNo
        self.name = name
        self.imageName = imageName
        self.type = type
        self.length = length
        self.is3D = is3D
        if is3D {
            self.price = 3000
        } else {
            self.price = 2000
        }
    }
}
