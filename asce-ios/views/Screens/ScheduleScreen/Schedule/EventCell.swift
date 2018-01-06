//
//  EventCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Copyright © 2017 tutorials. All rights reserved.
//  inspired by Connfa!
//  http://connfa.com
//

import UIKit

class EventCell:UITableViewCell{
    private var isEnabled: Bool?;
    private var isFavorite: Bool?;
    
    @IBOutlet weak var rightContentView: UIView!
    @IBOutlet weak var leftContentView: UIView!
    
    @IBOutlet weak var coverButton: ZFRippleButton!
    
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var speakerLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var event : ScheEvent!;
    private var uniquePath : IndexPath!
    private var delegate : TableButtonDelegate!
    var date:String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setCustomFonts()
        self.layoutIfNeeded()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    
    func setCustomFonts(){
        //No implementation
    }
    

    func initData(_ thisEvent: ScheEvent, _ path: IndexPath, _ delegate: TableButtonDelegate){
        self.event = thisEvent
        self.endLabel.text = thisEvent.endtime
        self.startLabel.text = thisEvent.starttime
        self.speakerLabel.text = thisEvent.speakers
        self.date = thisEvent.date
        if(thisEvent.speakers == ""){
            self.speakerLabel.text = "n/a"
        }
        self.titleLabel.text = thisEvent.name
        self.locationLabel.text = thisEvent.room
        self.uniquePath = path
        self.delegate = delegate
        self.coverButton.addTarget(self, action: #selector(coverButtonClicked), for: UIControlEvents.touchUpInside)
    }
    @objc
    func coverButtonClicked(_ sender: Any){
        delegate.buttonClicked(at:self.uniquePath)
    }
    
    //func getHeightForEvent(event:ScheEvent, isFirst: Bool)->Float{}
    
}
