//
//  MainViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 11/23/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation

class MainViewVontroller : BaseViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildView(storyBoardID: "HomeStoryBoard", titleOfChildren: "Home", iconName: "home")
        addChildView(storyBoardID: "ScheduleStoryBoard", titleOfChildren: "Schedule", iconName: "time")
        addChildView(storyBoardID: "SpeakerStoryBoard", titleOfChildren: "Speakers", iconName: "msg")
        addChildView(storyBoardID: "SponsorStoryBoard", titleOfChildren: "Sponsers", iconName: "bag")
        addChildView(storyBoardID: "ProgramStoryBoard", titleOfChildren: "Program", iconName: "book")
        addChildView(storyBoardID: "EventMapStoryBoard", titleOfChildren: "Event Map", iconName: "door")
        addChildView(storyBoardID: "EntertainmentStoryBoard", titleOfChildren: "Entertainments", iconName: "dinner")
        addChildView(storyBoardID: "FacebookStoryBoard", titleOfChildren: "Facebook", iconName: "f")
        addChildView(storyBoardID: "TwitterStoryBoard", titleOfChildren: "Twitter", iconName: "bird")
        
       showFirstChild()
    }
}
