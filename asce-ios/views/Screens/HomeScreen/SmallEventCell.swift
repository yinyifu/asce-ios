//
//  SmallEventCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/15/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit
class SmallEventCell : UITableViewCell {
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBAction func coverButtonClicked(_ sender: Any) {
        self.delegate.buttonClicked(at: self.index)
    }
    private var delegate: TableButtonDelegate!;
    private var index : IndexPath!;
    func initData(_ event : ScheEvent, _ path: IndexPath, _ delegate : TableButtonDelegate){
        let image = UIImage.init(named: "time")
        eventImage.image = image
        eventDate.text = event.date
        eventTime.text = "\(event.starttime) - \(event.endtime)"
        eventLocation.text = event.room
        self.index = path
        
    }
}
