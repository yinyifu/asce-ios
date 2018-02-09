//
//  ASCETWTRViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/21/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //The screen name allows to get all tweets for that account in the timeline
        //self.dataSource = TWTRUserTimelineDataSource(screenName: "ASCETweets", apiClient: TWTRAPIClient())
        //Using seach query for hashtags
        
        let client = TWTRAPIClient()
        //i believe * in search query means everything containing asce at the beginning
        // yes you are correct
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#ERYMC OR #ERYMC2018 OR #MRLC2018 OR #MRLC18 OR #ASCE", apiClient: client)
    }
}
