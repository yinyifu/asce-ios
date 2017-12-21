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
        addChildView(storyBoardID: "board1", titleOfChildren: "Home", iconName: "home")
        addChildView(storyBoardID: "board1", titleOfChildren: "Schedule", iconName: "time")
        addChildView(storyBoardID: "board1", titleOfChildren: "Speakers", iconName: "msg")
        addChildView(storyBoardID: "board1", titleOfChildren: "Sponsers", iconName: "bag")
        addChildView(storyBoardID: "board1", titleOfChildren: "Program", iconName: "book")
        addChildView(storyBoardID: "board1", titleOfChildren: "Event Map", iconName: "door")
        addChildView(storyBoardID: "board1", titleOfChildren: "Entertainments", iconName: "dinner")
        addChildView(storyBoardID: "board1", titleOfChildren: "Facebook", iconName: "f")
        addChildView(storyBoardID: "board1", titleOfChildren: "Twitter", iconName: "bird",viewController:ASCETWTRViewController())
        
        showFirstChild()
    }
}
