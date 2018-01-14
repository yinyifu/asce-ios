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
    var lastnameInits: Array<String> = Array()
    var lastnameCounts: Array<Int> = Array()
    var namesInSections: Array<Array<String>> = Array<Array>()
    
    override func viewDidLoad(){
        for events in schedules{
            for nameSS in (events.speakers?.split(separator: ","))!{
                
                let name = String(nameSS).trimmingCharacters(in: .whitespacesAndNewlines)
                if(!names.contains(name)){
                    names.append(name)
                }
            }
        }
        sortNamesByLastName()
    }

    func sortNamesByLastName()
    {
        var lastnames: Array<String> = Array()
        for name in names
        {
            var nameSeg = name.split(separator: " ")
            lastnames.append(String(nameSeg[nameSeg.count-1]))
        }
        var x = 0,y = 0;
        while x < lastnames.count
        {
            y = x+1;
            while y < lastnames.count
            {
                
                if(lastnames[x].compare(lastnames[y]).rawValue>0)
                {
                    let lastname = lastnames[x];
                    lastnames[x] = lastnames[y];
                    lastnames[y] = lastname;
                    
                    let name = names[x];
                    names [x] = names[y];
                    names[y] = name;
                }
               y=y+1
            }
            x=x+1
        }
        var ct = 0
        var nct = 0
        var As:Array<String> = Array()
        for name in lastnames
        {
            let li = String(Array(name)[0])
            if(!lastnameInits.contains(li))
            {
                if !(ct==0)
                {
                    namesInSections.append(As)
                    As = Array()
                    As.append(names[nct])
                    lastnameCounts.append(ct)
                    ct = 1
                }
                else
                {
                    As.append(names[nct])
                    ct = ct+1
                }
                lastnameInits.append(li)
            }
            else
            {
                As.append(names[nct])
                ct = ct+1
            }
            nct = nct+1
        }
        namesInSections.append(As)
        lastnameCounts.append(ct)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return lastnameInits.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lastnameCounts[section]
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return lastnameInits[section]
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("Speaker", owner: Speaker.self, options: <#T##[AnyHashable : Any]?#>)
        cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        let Name = namesInSections[indexPath.section][indexPath.row]
        cell.nameLabel?.text = Name
        //cell.profileImage?.image = UIImage(named:Name)
        cell.profileImage.image = UIImage(named:"Apple")
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath)
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return lastnameInits
    }

}
