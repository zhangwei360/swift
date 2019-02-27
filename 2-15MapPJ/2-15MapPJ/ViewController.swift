//
//  ViewController.swift
//  2-15MapPJ
//
//  Created by JiaLidan on 2019/2/15.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var testMap: MKMapView!
    //定义j纬度 经度
    let latitude:CLLocationDegrees = 48.858547
    let longitude:CLLocationDegrees = 2.294524
    //设置比例
    let xScale: CLLocationDegrees = 0.01
    let yScale: CLLocationDegrees = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //定义位置
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        //定义比例
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
        
        //设置位置
        let region: MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        
        testMap.setRegion(region, animated: true)
        testMap.mapType = .standard
        
//        //加图钉
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = myLocation
//        annotation.title = "埃菲尔铁塔"
//        annotation.subtitle = "法国"
//        //画面上添加图定
//        testMap.addAnnotation(annotation)
        
        
    }
    
    @IBAction func addAnnotation(_ sender: UILongPressGestureRecognizer) {
        let touchPoint = sender.location(in: testMap)
        let touchCoordinate:CLLocationCoordinate2D = testMap.convert(touchPoint, toCoordinateFrom: testMap)
        let annotation = MKPointAnnotation()
                annotation.coordinate = touchCoordinate
                annotation.title = "埃菲尔铁塔"
                annotation.subtitle = "法国"
                //画面上添加图定
                testMap.addAnnotation(annotation)
    }
    


}

