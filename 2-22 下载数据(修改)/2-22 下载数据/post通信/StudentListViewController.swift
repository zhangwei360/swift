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
    case AddOne
}

var studentList:[SingleStudent] = []
var host = "http://www.kinwork.jp:7775/LearnApi"

class StudentListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var session: URLSession?
    
    
    var postUrl_getAll = "/getStudentList"
    var postUrl_GetSingle = "/viewStudent"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = URLSession(configuration: .default)

        listTableView.delegate = self
        listTableView.dataSource = self
        
        //进行获得学生一览的通信
        let strUrl = host + postUrl_getAll
        
        var postClass = PostClass()
        postClass.deleagte = self
        
        postClass.getData(strUrl: strUrl, type: .GetAll, para: nil)
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailSegue" {
            let detail = segue.destination as! SingleStudentViewController
            detail.singleStundentDetail = sender as? SingleStundentDetail
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
            var postClass = PostClass()
            postClass.deleagte = self
            postClass.getData(strUrl: strUrl, type: .GetSingle, para: paraDict)
        }
    }
}

extension StudentListViewController: PostDelegate {
    func reloadTableView() {
        listTableView.reloadData()
    }
    
    func toNextPage(selectedStudent: SingleStundentDetail) {
        self.performSegue(withIdentifier: "ToDetailSegue", sender: selectedStudent)
    }
    
    
}
