//
//  EventDetailViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/4/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit
class EventDetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, TableButtonDelegate{
    
    func buttonClicked(at path: IndexPath) {
        guard path.first! == EventDetailViewController.speakersSectionIndex else{
            return
        }
        if let speakerDetail = speakers?[path.row-1]{
            let vc = EventLoader.generateSpeakerDetailViewController(speakerDetail)
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            fatalError("No Speaker Detail Found")
        }
    }
    
    private var event : ScheEvent!;
    private var speakers : [Speaker]?;
    
    static let headerSectionIndex = 0;
    static let speakersSectionIndex = 1;
    static let descriptionSectionIndex = 2;
    
    @IBOutlet weak var eventDetailTableView: UITableView!
    convenience init(_ event : ScheEvent){
        self.init()
        self.initData(event)
    }
    
    func initData(_ event:ScheEvent){
        self.event = event
        self.speakers = EventLoader.getEventSpeakers(event)
    }
    @objc
    func bookmarkJustClicked(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventDetailTableView.delegate = self
        self.eventDetailTableView.dataSource = self
        self.eventDetailTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        // identify if the object is already bookmarked
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.bookmarks, target: self, action: #selector(bookmarkJustClicked))
        
        self.parent?.automaticallyAdjustsScrollViewInsets = true
        self.automaticallyAdjustsScrollViewInsets = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y < 0){
            scrollView.contentOffset.y = 0;
        }
    }
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.first!;
        if(section == EventDetailViewController.headerSectionIndex){
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailHeader") as! EventDetailHeaderCell
            cell.initData(self.event)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }else if(section == EventDetailViewController.speakersSectionIndex){
            if(indexPath.row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSpeakerHeader")!;
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSpeaker") as! SpeakerCell
            cell.initDate(self.speakers![indexPath.row-1])
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }else{
            let cell = Bundle.main.loadNibNamed("DescriptionCell", owner: DescriptionCell.self, options: nil)![0] as! DescriptionCell
            cell.initData(self.event.desc!)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.isUserInteractionEnabled = false
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.first!;
        if(section == EventDetailViewController.headerSectionIndex){
            
            return 200
        }else if(section == EventDetailViewController.speakersSectionIndex){
            if(indexPath.row == 0){
                return 25
            }
            return 48
        }else{
            let dcell = Bundle.main.loadNibNamed("DescriptionCell", owner: DescriptionCell.self, options: nil)![0] as! DescriptionCell
            
            return dcell.heightForCell(withText: self.event.desc!) + 30
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.buttonClicked(at: indexPath)
    }
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        return
    }
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == EventDetailViewController.headerSectionIndex){
            return 1
    
        }else if(section == EventDetailViewController.speakersSectionIndex){
            
            if speakers == nil{
                return 0
            }
            return speakers!.count + 1
            
        }else if(section == EventDetailViewController.descriptionSectionIndex){
            return 1
        }
        return 0
    }
}
