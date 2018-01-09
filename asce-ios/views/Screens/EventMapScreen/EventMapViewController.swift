//
//  EventMapViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit

class EventMapViewController : UITabBarController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        let mezz = self.viewControllers![1] as! PdfViewerController
        let second = self.viewControllers![2] as! PdfViewerController
        mezz.initData(linkForPdf: "Mezzanine")
        second.initData(linkForPdf: "Second Level")
    }
}
