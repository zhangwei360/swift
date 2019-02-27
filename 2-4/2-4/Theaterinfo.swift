//
//  Theaterinfo.swift
//  2-4
//
//  Created by JiaLidan on 2019/2/4.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import Foundation

struct TheaterInfo {
    var theaterNo: Int?
    var startTime: Int?
    var restTime: Int?
    var movies: [Int] = []
    var canBe3D: Bool?
    
    init(theaterNo: Int, startTime: Int, restTime: Int, movies: [Int], canBe3D: Bool) {
        self.theaterNo = theaterNo
        self.startTime = startTime
        self.restTime = restTime
        self.movies = movies
        self.canBe3D = canBe3D
    }
    
}
var theaterInfos: [TheaterInfo] = [TheaterInfo(theaterNo: 1, startTime: 600, restTime: 10, movies: [3, 1, 4, 1], canBe3D: false),
                                   TheaterInfo(theaterNo: 2, startTime: 660, restTime: 10, movies: [1, 2, 1, 2], canBe3D: true),
                                   TheaterInfo(theaterNo: 3, startTime: 780, restTime: 10, movies: [4, 3, 2, 3], canBe3D: false)]
