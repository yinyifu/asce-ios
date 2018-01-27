//
//  EventMapViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class EventMapViewController : UITabBarController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        let map = self.viewControllers![0] as! GlobalMapViewController
        let mezz = self.viewControllers![1] as! PdfViewerController
        let second = self.viewControllers![2] as! PdfViewerController
        map.initData(CLLocation(latitude: 42.8879852, longitude: -78.8764571))
        mezz.initData(linkForPdf: "Mezzanine")
        second.initData(linkForPdf: "Second Level")
        
        
    }
}
