//
//  MainViewController.swift
//  2-4
//
//  Created by JiaLidan on 2019/2/4.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    var movieInfos:[MovieInfo] = [MovieInfo(movieNo: 1, name: "筑梦演艺圈", imageName: "zhu", type: "a", length: 100, is3D: true),
                                  MovieInfo(movieNo: 2, name: "祖宗十九代", imageName: "zu", type: "a", length: 120, is3D: true),
                                  MovieInfo(movieNo: 3, name: "小时代", imageName: "xiao", type: "a", length: 90, is3D: true),
                                  MovieInfo(movieNo: 4, name: "爱情公寓", imageName: "ai", type: "a", length: 117, is3D: true)]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func setSchedule(n: Int) -> [(theaterNo: Int, time: String)] {
        var realSchedule: [(theaterNo: Int, time: String)] = []
//        for i in 0...theaterInfos.count - 1 {
//            switch theaterInfos[i].theaterNo! {
//            case 1:
//                for j in 0...theaterInfos[i].movies.count - 1 {
//                    realSchedule.append((1,"\(theaterInfos[0].startTime! / 60):\(theaterInfos[0].startTime! % 60) - \(theaterInfos[0].startTime! + movieInfos[j].length!)"))
//                }
//            case 2:
//                for j in 0...theaterInfos[i].movies.count - 1 {
//                    realSchedule.append((2,"\(theaterInfos[1].startTime! / 60):\(theaterInfos[1].startTime! % 60) - \(theaterInfos[1].startTime! + movieInfos[j].length!)"))
//                }
//            case 3:
//                for j in 0...theaterInfos[i].movies.count - 1 {
//                    realSchedule.append((2,"\(theaterInfos[2].startTime! / 60):\(theaterInfos[2].startTime! % 60) - \(theaterInfos[2].startTime! + movieInfos[j].length!))"))
//                }
//            default:
//                break
//            }1
//        }
        var startTime = 0
        
            switch n {
            case 1:
                startTime = theaterInfos[0].startTime!
                for i in 0...theaterInfos[0].movies.count - 1 {
                    realSchedule.append((1, "\(startTime / 60):\(startTime % 60)-\(startTime + movieInfos[theaterInfos[0].movies[i]])"))
                }
            case 2:
                for i in 0...theaterInfos[1].movies.count - 1 {
                    realSchedule.append((2,"\(theaterInfos[1].startTime! / 60):\(theaterInfos[1].startTime! % 60) - \(theaterInfos[1].startTime! + movieInfos[j].length!)"))
                }
            case 3:
                for i in 0...theaterInfos[2].movies.count - 1 {
                    realSchedule.append((2,"\(theaterInfos[2].startTime! / 60):\(theaterInfos[2].startTime! % 60) - \(theaterInfos[2].startTime! + movieInfos[j].length!))"))
                }
            default:
                break
            }
        return realSchedule
    }

   

}
