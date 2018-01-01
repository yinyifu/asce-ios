//
//  SpeakerViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit

class SpeakerViewController : UITableViewController
{
    private var schedules = EventLoader.schedulee2!
    var names: Array<String> = Array()
    
    
    override func viewDidLoad(){
        for events in schedules{
            for nameSS in (events.speakers?.split(separator: ","))!{
                let name = String(nameSS).trimmingCharacters(in: .whitespacesAndNewlines)
                if(!names.contains(name)){
                    names.append(name)
                }
            }
        }
        print(names)
        print(String(names.count))
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakerTableViewCell", for: indexPath) as! SpeakerTableViewCell
        
        let Name = names[indexPath.row]
        cell.nameLabel?.text = Name
        cell.profileImage?.image = UIImage(named:Name)
        return cell
    }
}
