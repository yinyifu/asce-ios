//
//  PdfViewerController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/9/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class PdfViewerController : UIViewController{
    var pdfAy : String?;
    private var fresh : Bool = true;
    
    
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
        }
        
    }
}
