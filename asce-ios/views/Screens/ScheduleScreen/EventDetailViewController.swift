//
//  EventDetailViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/4/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit
class EventDetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    private var event : ScheEvent!;
    private var speakers : [Speaker]?;
    
    
    static let headerSectionIndex = 0;
    static let speakersSectionIndex = 1;
    static let descriptionSectionIndex = 2;
    
    @IBOutlet weak var eventDetailTableView: UITableView!
    convenience init(_ event : ScheEvent){
        self.init()
        self.event = event
        let speakers = event.speakers
        self.eventDetailTableView.delegate = self
        self.eventDetailTableView.dataSource = self
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.first!;
        if(section == EventDetailViewController.headerSectionIndex){
            let cell =  EventDetailHeaderCell();
            cell.initData(self.event)
            return cell
        }else if(section == EventDetailViewController.speakersSectionIndex){
            let cell = SpeakerCell()
            
            cell.initDate(self.speakers![indexPath.row])
            return cell
        }else{
            let cell = DescriptionCell()
            cell.initData(self.event.desc!)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.first!;
        if(section == EventDetailViewController.headerSectionIndex){
            
            return 170
        }else if(section == EventDetailViewController.speakersSectionIndex){
            
            return 48
        }else{
            let dcell = tableView.cellForRow(at: indexPath) as! DescriptionCell
            return dcell.heightForCell(withText: self.event.desc!)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == EventDetailViewController.headerSectionIndex){
            return 1
        }else if(section == EventDetailViewController.speakersSectionIndex){
            return speakers!.count+1
        }else{
            return 1
        }
    }
    func updateView(){
        
    }
}
