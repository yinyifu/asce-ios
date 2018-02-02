//
//  EmergencyCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/30/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit


class EmergencyCell : UITableViewCell{
    
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var location: UILabel!
    
    func initData(_ location:String, _ name: String, _ phone: String){
        self.location.text = location
        self.place.text = name
        self.phone.text = phone
    }
    func getHeight()->CGFloat{
        return 130
    }
}
