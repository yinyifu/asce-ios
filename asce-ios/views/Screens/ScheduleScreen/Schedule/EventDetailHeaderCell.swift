//
//  EventDetailHeaderTableViewCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/5/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class EventDetailHeaderCell : UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locLabel: UILabel!
    
    @IBOutlet weak var organizationLabel: UILabel!
    
    @IBOutlet weak var eventDetailContainerView: UIView!
    @IBOutlet weak var organizationContainerView: UIView!
    
    @IBOutlet weak var organizationHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }
    
    func initData(_ event:ScheEvent){
        let preferedWidth = UIScreen.main.bounds.size.width - 30
        self.titleLabel.preferredMaxLayoutWidth = preferedWidth
        self.locLabel.preferredMaxLayoutWidth = preferedWidth
        self.titleLabel.text = event.name
        let date = event.date
        let start_time = event.starttime
        let end_time = event.endtime
        let place = event.room
        
        let date_time = "\(date) \(start_time) - \(end_time)"
        
        if place! == ""{
            self.locLabel.text = date_time
        }else{
            self.locLabel.text = "\(date_time) in \(place!)"
        }
        self.organizationLabel.text = event.organizations
    }
}
