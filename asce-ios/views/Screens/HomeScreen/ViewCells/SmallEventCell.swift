//
//  SmallEventCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/15/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit
class SmallEventCell : UICollectionViewCell {
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventTile: UILabel!
    
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBAction func coverButtonClicked(_ sender: Any) {
        self.delegate.buttonClicked(at: self.index)
    }
    private var delegate: TableButtonDelegate!;
    private var index : IndexPath!;
    func initData(_ event : ScheEvent, _ path: IndexPath, _ delegate : TableButtonDelegate){
        //let dateForm = event.date.split(separator: "-")
        eventTile.text = event.name
        /*
            let starttime = event.starttime.split(separator: " ")[0]
            let startcc = event.starttime.split(separator: " ")[1]
            let endtime = event.endtime.split(separator: " ")[0]
            eventTime.text = "\(starttime)-\(endtime) \(startcc)"
         
            eventLocation.text = event.room
            if(event.room == "See Description"){
                eventLocation.text = "See Desc"
            }
        */
        self.eventTile.layer.cornerRadius = 5
        self.eventTile.clipsToBounds = true
        self.index = path
        self.delegate = delegate
    
    }
}
