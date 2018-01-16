//
//  MyTableCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/15/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class MyTableCell : UITableViewCell {
    
    @IBOutlet weak var myEventView: CollectionViewer!
    private var eventsToShow : [ScheEvent]!
    
    func initData(_ events : [ScheEvent], _ vc: UINavigationController){
        self.eventsToShow = events
        self.myEventView.initData(self.eventsToShow, vc)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
