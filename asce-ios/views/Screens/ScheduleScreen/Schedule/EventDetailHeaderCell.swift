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
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var EventLogo: UIImageView!
    @IBOutlet weak var titleDetailView: UIView!
    
    
    func initData(event:ScheEvent){
        
        
    }
}
