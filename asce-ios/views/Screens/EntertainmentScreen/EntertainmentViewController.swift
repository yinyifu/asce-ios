//
//  EntertainmentViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit

class EntertainmentViewController : UIViewController
{
    @IBAction func recp(_ sender: Any) {
        let url = URL(string: urlString2)!
        UIApplication.shared.openURL(url)
    }
    @IBAction func vstp(_ sender: Any) {
        
        let url = URL(string: urlString)!
        UIApplication.shared.openURL(url)
    }
    
    
   
    let urlString = "http://www.visitbuffaloniagara.com/";
    let urlString2 = "http://ascebuffalo.org/recommendations/"
    
}
