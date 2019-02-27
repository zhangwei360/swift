//
//  MainViewController.swift
//  2-2画面复习
//
//  Created by JiaLidan on 2019/2/2.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var changePageControl: UIPageControl!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    var foodInfos: [(foodName: String, imageName: String, cailiao: [String], zuofa: String)] =
        [("饺子", "1", ["面粉", "猪肉", "韭菜"], "蒸"),
         ("包子", "2", ["面粉", "猪肉", "韭菜"], "蒸"),
         ("烧饼", "3", ["面粉", "麻酱", "芝麻"], "烤")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage(num: changePageControl.currentPage) //调用图片和Label的设置方法
        
        changePageControl.addTarget(self, action: #selector(changeImage), for: .valueChanged)
        
        let tapGesture = UIGestureRecognizer(target: self, action: #selector (tapImage)) //创建手势交互
        
        foodImageView.addGestureRecognizer(tapGesture) //将手势加到图片
//
        foodImageView.isUserInteractionEnabled = true //允许用户与控件交互
//
        self.view.addGestureRecognizer(tapGesture)
        
//        tapGesture.delegate = self
    }
    @objc func changeImage(_ sender: UIPageControl ) { //调用图片和Label的设置方法
        setupImage(num: sender.currentPage)
    }
    @objc func tapImage(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "toDetailSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            let nextPageVC = segue.destination as! DetailViewController
            nextPageVC.foodDetails = (foodInfos[changePageControl.currentPage].cailiao, foodInfos[changePageControl.currentPage].zuofa)
        }
    }
    
    func setupImage(num: Int) { //根据PageControl设置图片和Label
        foodImageView.image = UIImage(named: foodInfos[num].imageName)
        foodNameLabel.text = foodInfos[num].foodName
    }

    

}
//extension MainViewController: UIGestureRecognizerDelegate {
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        if touch.view != foodImageView {
//            return true
//        } else {
//            return false
//        }
//    }
//}
