//
//  StudentListViewController.swift
//  2-22 下载数据
//
//  Created by JiaLidan on 2019/2/24.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

enum PostType {
    case GetAll
    case GetSingle
}

class StudentListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var session: URLSession?
    
    var studentList:[SingleStundentDetail] = []
    var host = "http://www.kinwork.jp:7775/LearnApi"
    var postUrl_getAll = "/getStudentList"
    var postUrl_GetSingle = "/viewStudent"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = URLSession(configuration: .default)

        listTableView.delegate = self
        listTableView.dataSource = self
        
        //进行获得学生一览的通信
        let strUrl = host + postUrl_getAll
        getData(strUrl: strUrl, type: .GetAll, para: nil)
    }
    
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
            
            let task = session?.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                if let downloadData = data {
                    do {
                        switch type {
                        case .GetAll:
                            self.studentList = try JSONDecoder().decode([SingleStundentDetail].self, from: downloadData)
                                DispatchQueue.main.async(execute: {
                                    self.listTableView.reloadData()
                                })
                        case .GetSingle:
                            let selectedStudent = try JSONDecoder().decode(SingleStundentDetail.self, from: downloadData)
                            DispatchQueue.main.async(execute: {
                                self.performSegue(withIdentifier: "ToDetailSegue", sender: selectedStudent)
                            })
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            })
            task?.resume()
        }
    }
    
    
    
    
    
}
extension StudentListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentTableViewCell
        cell.singleStudent = studentList[indexPath.row]
        cell.setupData()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let studentNo = studentList[indexPath.row].s_no {
            let paraDict = ["s_no": studentNo]
            let strUrl = host + postUrl_GetSingle
            getData(strUrl: strUrl, type: .GetSingle, para: paraDict)
        }
    }
}
