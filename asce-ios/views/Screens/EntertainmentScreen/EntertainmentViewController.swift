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
    let urlString = "http://www.visitbuffaloniagara.com/";
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL.init(string: self.urlString){
            let urlreq = URLRequest.init(url: url)
            let webview = UIWebView.init(frame: self.view.frame)
            webview.loadRequest(urlreq)
            self.view.addSubview(webview)
        }
    }
}
