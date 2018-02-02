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
    
    @IBAction func bacl(_ sender: Any) {
        if(self.webview.canGoBack){
            self.webview.goBack()
        }
    }
    @IBAction func forward(_ sender: Any) {
        if(self.webview.canGoForward){
            self.webview.goForward()
        }
    }
    
    @IBOutlet weak var webview: UIWebView!
    
    
    let urlString = "http://www.visitbuffaloniagara.com/";
    let urlString2 = "http://ascebuffalo.org/recommendations/"
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
}
