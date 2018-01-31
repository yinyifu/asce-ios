//
//  PdfViewerController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/9/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class PdfViewerController : UIViewController{
    @IBInspectable var pdfAy : String?;
    @IBInspectable var ext = "pdf"
    private var fresh : Bool = true;
    override func viewDidLoad() {
        
    }
    
    func initData(linkForPdf : String) {
        pdfAy = linkForPdf
        if let url = Bundle.main.url(forResource: linkForPdf, withExtension: "pdf"){
            let webview = UIWebView.init(frame: self.view.frame)
            let urlRequest = URLRequest.init(url: url)
            webview.loadRequest(urlRequest)
            webview.scalesPageToFit = true
            self.view.addSubview(webview)
            self.tabBarItem.title = linkForPdf
            self.tabBarItem.image = UIImage.init(named: "floor2")
            
            self.fresh = false
        }else if let url = Bundle.main.url(forResource: linkForPdf, withExtension: "png"){
            let webview = UIWebView.init(frame: self.view.frame)
            let urlRequest = URLRequest.init(url: url)
            webview.loadRequest(urlRequest)
            webview.scalesPageToFit = true
            self.view.addSubview(webview)
            self.tabBarItem.title = linkForPdf
            self.tabBarItem.image = UIImage.init(named: "floor2")
            
            self.fresh = false
            
        }else if let url = Bundle.main.url(forResource: linkForPdf, withExtension: "docx"){
            let webview = UIWebView.init(frame: self.view.frame)
            let urlRequest = URLRequest.init(url: url)
            webview.loadRequest(urlRequest)
            webview.scalesPageToFit = true
            self.view.addSubview(webview)
            self.tabBarItem.title = linkForPdf
            self.tabBarItem.image = UIImage.init(named: "floor2")
            
            self.fresh = false
            
        }
        
    }
}
