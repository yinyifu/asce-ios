//
//  EventDetailViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/4/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit
class EventDetailViewController : UITableViewController{
    private var event : ScheEvent!;
    private var speakers : [Speaker]?;
    
    
    static let headerSectionIndex = 0;
    static let speakersSectionIndex = 1;
    static let schedulesSectionIndex = 2;
    static let descriptionSectionIndex = 3;
    
    convenience init(_ event : ScheEvent){
        self.init()
        self.event = event
        let speakers = event.speakers
        if let speakersexists = speakers{
            self.speakers = []
            let strfg = speakersexists.split(separator: ",")
            for ele in strfg {
                let strfgnospace = ele.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                let speaker = EventLoader.getQuerySpeakers(query: "SELECT * from Speakers where name = '\(strfgnospace)'")
                self.speakers!.append(contentsOf: speaker)
                print(speaker)
            }
        }else{
            self.speakers = nil;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateView()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        re
    }
    func updateView(){
        
    }
}
