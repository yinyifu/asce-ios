//
//  File.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/30/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class ReadMoreCell : UITableViewCell {
    private var sakuzyo : UINavigationController!;
    @IBAction func letterButton(_ sender: Any) {
        let pdfWow = PdfViewerController();
        pdfWow.initData(linkForPdf: "WL DRAFT")
        sakuzyo.pushViewController(pdfWow, animated: true)
    }
    func initData(_ handler: UINavigationController){
        sakuzyo = handler
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

