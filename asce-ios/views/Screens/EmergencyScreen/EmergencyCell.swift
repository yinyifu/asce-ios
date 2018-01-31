//
//  EmergencyCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/30/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit


class EmergencyCell : UITableViewCell{
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phoen: UILabel!
    
    func initData(_ location:String, _ name: String, _ phone: String){
        self.location.text = location
        self.name.text = name
        self.phoen.text = phone
    }
}
