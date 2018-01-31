//
//  GroupMeViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 1/30/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import Foundation
import UIKit

class GroupMeViewController : UIViewController
{
    let urlString = "https://groupme.com/join_group/33044875/JACRv8";
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

