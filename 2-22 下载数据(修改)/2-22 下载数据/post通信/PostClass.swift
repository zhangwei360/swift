//
//  PostClass.swift
//  2-22 下载数据
//
//  Created by JiaLidan on 2019/2/28.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import Foundation

protocol PostDelegate {
    func reloadTableView()
    
    func toNextPage(selectedStudent: SingleStundentDetail)
}

class PostClass {
    
    var deleagte: PostDelegate?
    
    var session = URLSession(configuration: .default)
    
    func getData(strUrl: String, type: PostType, para: [String: String]?) {
        //        let strUrl = host + postUrl_getAll
        if let url = URL(string: strUrl) {
            var request = URLRequest(url: url)
            
            let list = NSMutableArray()
            if para != nil {
                //设置通信方式为Post
                request.httpMethod = "POST"
                //整理Post用的数据
                for (key, value) in para! {
                    let itemStr = "\(key)=\(value)"
                    list.add(itemStr)
                }
                let paraStr = list.componentsJoined(by: "&")
                let paraData = paraStr.data(using: String.Encoding.utf8)
                request.httpBody = paraData
            }
            
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                if let downloadData = data {
                    do {
                        switch type {
                        case .GetAll:
                            studentList = try JSONDecoder().decode([SingleStudent].self, from: downloadData)
                            DispatchQueue.main.async(execute: {
                                self.deleagte?.reloadTableView()
//                                self.listTableView.reloadData()
                            })
                        case .GetSingle:
                            let selectedStudent = try JSONDecoder().decode(SingleStundentDetail.self, from: downloadData)
                            DispatchQueue.main.async(execute: {
                                self.deleagte?.toNextPage(selectedStudent: selectedStudent)
//                                self.performSegue(withIdentifier: "ToDetailSegue", sender: selectedStudent)
                            })
                        case .AddOne:
                            do {
                                let json = try JSONSerialization.jsonObject(with: downloadData, options: [])
                                print(json)
                            } catch {
                                
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            })
            task.resume()
        }
    }
    
}
