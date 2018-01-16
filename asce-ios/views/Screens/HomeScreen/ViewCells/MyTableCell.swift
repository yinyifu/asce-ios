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
    
    func initData(_ events : [ScheEvent], _ vc: UITableViewController){
        self.eventsToShow = events
        self.myEventView.initData(self.eventsToShow, vc)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func beginUpdate(_ eve : [ScheEvent]){
        self.myEventView.reloadData()
        self.myEventView.eventsToShow = eve
       
        self.myEventView.performBatchUpdates({ () -> Void in
            for i in 0...eve.count{
             //   self.myEventView.insertItems(at: [IndexPath(row: i, section: 0)])
            }
        }, completion: nil)
    }
    
}
