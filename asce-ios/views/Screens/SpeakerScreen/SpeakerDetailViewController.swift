//
//  SpeakerDetailViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/7/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class SpeakerDetailViewController : UITableViewController, TableButtonDelegate {
    func buttonClicked(at path: IndexPath) {
        let targetEvent = self.speakerEvents[path.row-1]
        let vc = EventLoader.generateEventDetailViewController(targetEvent)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private var speakerEvents : [ScheEvent]!
    private var theSpeaker : Speaker!
    
    static private let header = 0;
    static private let events = 0;
    
    func initData(speaker : Speaker){
        self.theSpeaker = speaker
        let query = "SELECT * from Event WHERE speaker LIKE '%\(speaker.name)%'"
        self.speakerEvents = EventLoader.getQueryEvents(query: query, tname: "Event")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case SpeakerDetailViewController.header:
            return 1;
        default:
            if(self.speakerEvents.count == 0){
                return 0
            }else{
                return self.speakerEvents.count + 1
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.first!;
        switch section {
        case SpeakerDetailViewController.header:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "speakerHeader", for: indexPath) as! SpeakerTableViewCell;
            cell.initData(self.theSpeaker)
            return cell;
        default:
            if(indexPath.row == 0){
                return self.tableView.dequeueReusableCell(withIdentifier: "speakerEventName", for: indexPath)
            }else{
                let cell = Bundle.main.loadNibNamed("EventCell", owner: EventCell.self, options: nil)![0] as! EventCell
                cell.initData(self.speakerEvents[indexPath.row-1], indexPath, self)
                return cell
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.first!;
        switch section {
        case SpeakerDetailViewController.header:
            return 200;
        default:
            if(indexPath.row == 0){
                return 25
            }else{
                return 100
            }
        }
    }
    
}
