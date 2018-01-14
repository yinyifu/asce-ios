//
//  SpeakerDetailViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/7/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class SpeakerDetailViewController : UITableViewController {
    
    private var speakerEvents : [ScheEvent]!
    private var theSpeaker : Speaker!
    
    func initData(speaker : Speaker){
        self.theSpeaker = speaker
        let query = "SELECT * from Event WHERE speaker LIKE '%\(speaker.name)%'"
        self.speakerEvents = EventLoader.getQueryEvents(query: query, tname: "Event")
        
    }
    
    
    
    
}
