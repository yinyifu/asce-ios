//
//  SpeakerCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/5/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class SpeakerCell : UITableViewCell {
    @IBOutlet weak var speakerNameLabel: UILabel!
    
    @IBOutlet weak var speakerTitleLabel: UILabel!
    
    @IBOutlet weak var speakerProfileImage: UIImageView!
    private var speaker : Speaker!;
    private var indexp : IndexPath!;
    private var dele : TableButtonDelegate!;
    @IBOutlet weak var coverButton: ZFRippleButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setSpeaker(_ spr:Speaker){
        self.speaker = spr;
        self.speakerNameLabel.text = speaker.name
        self.speakerTitleLabel.text = speaker.title
        self.speakerProfileImage.image = speaker.profile_pic
    }
    func initDate(_ spr : Speaker){
        self.setSpeaker(spr)
        let preferedW = UIScreen.main.bounds.size.width-85;
        self.speakerTitleLabel.preferredMaxLayoutWidth = preferedW
        self.speakerTitleLabel.preferredMaxLayoutWidth = preferedW
        
    }
    
    
    
}
