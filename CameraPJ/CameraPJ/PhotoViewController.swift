//
//  PhotoViewController.swift
//  CameraPJ
//
//  Created by WANG on 2018/10/19.
//  Copyright © 2018年 WANG. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func takePhoto(_ sender: UIButton) {
        //创建一个UIImagePickerController的Type
        let sourceType: UIImagePickerControllerSourceType = .camera
        
        //判断用户是否允许使用相机
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            //创建一个相机对象
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            
            //弹出画面
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func savePhoto(_ sender: UIButton) {
        let image = photoImageView.image
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(image!, self, #selector(saveFailed), nil)
        }
    }
    
    
    //指定为selector方法时要标明 @objc
    @objc func saveFailed(_ image:UIImage,didFinishSavingWithError error: NSError,contextInfo: UnsafeMutableRawPointer) {
        print(error.code)
    }
    
    @IBAction func findPhoto(_ sender: UIButton) {
        //创建一个UIImagePickerController的Type
        let sourceType: UIImagePickerControllerSourceType = .photoLibrary
        
        //判断用户是否允许使用相机
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            //创建一个相册对象
            let albumPicker = UIImagePickerController()
            albumPicker.sourceType = sourceType
            albumPicker.delegate = self
            
            //弹出画面
            self.present(albumPicker, animated: true, completion: nil)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//扩展相机类
extension PhotoViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //当照片被选中（拍照or相机中选择）后的处理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoImageView.image = pickedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    //相机或相机中 取消键 的处理
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}







































