//
//  SpeakerDetailViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/7/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class SpeakerDetailViewController : UITableViewController {

    var speakers:Array<Speaker> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func loadProfile(speakerProfile:Speaker)
    {
        speakers.append(speakerProfile)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SpeakerDetailViewCell = tableView.dequeueReusableCell(withIdentifier: "SpeakerDetailViewCell", for: indexPath) as! SpeakerDetailViewCell
        cell.labelForName.text = speakers[0].name
        cell.labelForTitle.text = speakers[0].title
        cell.profileImage.image = speakers[0].profile_pic
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
}
