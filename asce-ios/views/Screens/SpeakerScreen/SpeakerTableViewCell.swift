//
//  SpeakerTableViewCell.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit

class SpeakerTableViewCell : UITableViewCell
{
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func initData(_ speaker:Speaker){
        self.nameLabel.text = speaker.name
        self.titleLabel.text = speaker.title
        self.profileImage.image = speaker.profile_pic
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.width/2
    }
}

