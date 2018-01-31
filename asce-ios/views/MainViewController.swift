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
        addChildView(storyBoardID: "SponsorStoryBoard", titleOfChildren: "Sponsors", iconName: "bag")
        addChildView(storyBoardID: "ProgramStoryBoard", titleOfChildren: "Program", iconName: "book")
        addChildView(storyBoardID: "EventMapStoryBoard", titleOfChildren: "Maps", iconName: "door")
        addChildView(storyBoardID: "EntertainmentStoryBoard", titleOfChildren: "Entertainments", iconName: "dinner")
        addChildView(storyBoardID: "EventMapStoryBoard", titleOfChildren: "Emergency", iconName: "door")
        addChildView(storyBoardID: "TwitterStoryBoard", titleOfChildren: "Twitter", iconName: "bird")
        
        self.parent?.automaticallyAdjustsScrollViewInsets = false
        self.automaticallyAdjustsScrollViewInsets = false
       showFirstChild()
    }
}
