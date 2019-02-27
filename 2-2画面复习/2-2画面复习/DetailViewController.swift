//
//  DetailViewController.swift
//  2-2画面复习
//
//  Created by JiaLidan on 2019/2/2.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var foodDetails: (cailiao:[String], zuofa: String) = ([],"")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
    
    @IBAction func backToMain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodDetails.cailiao.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodTableViewCell
        if indexPath.row == foodDetails.cailiao.count {
            cell.formLabel.text = "做法"
            cell.foodLabel.text = foodDetails.zuofa
        } else if indexPath.row == 0 {
            cell.formLabel.text = "材料"
            cell.foodLabel.text = foodDetails.cailiao[0]
        } else {
            cell.formLabel.text = ""
            cell.foodLabel.text = foodDetails.cailiao[indexPath.row]
        }
        
        cell.foodLabel.text = "肉"
        return cell
    }
    
    
    
}
