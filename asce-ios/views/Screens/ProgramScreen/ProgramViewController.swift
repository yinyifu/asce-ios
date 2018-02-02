//
//  ProgramViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit

class ProgramViewController : PdfViewerController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData(linkForPdf: "WC Agenda")
        
    }
}
