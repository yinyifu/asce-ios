//
//  FacebookViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit

class FacebookViewController : UIViewController
{
    override func viewDidLoad() {
        guard let url = URL(string: "http://www.facebook.com") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }    }
    @IBOutlet weak var BUTTON: UIButton!
    
    @IBAction func onClick(_ sender: UIButton) {
        guard let url = URL(string: "http://www.facebook.com") else {
            return //be safe
        }
        
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
