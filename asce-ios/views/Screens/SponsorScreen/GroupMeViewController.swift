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
    @IBAction func back(_ sender: Any) {
        if(self.wv.canGoBack){
            self.wv.goBack()
        }
    }
    @IBOutlet weak var wv: UIWebView!
    @IBAction func forward(_ sender: Any) {
        if(self.wv.canGoForward){
            self.wv.goForward()
        }
    }
    let urlString = "https://groupme.com/join_group/33044875/JACRv8";
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL.init(string: self.urlString){
            let urlreq = URLRequest.init(url: url)
            
            self.wv.loadRequest(urlreq)
        }
    }
}

