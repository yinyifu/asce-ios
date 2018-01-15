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
    var namesInSections: Array<Array<String>> = Array<Array>()
    var speakers:Array<Array<Speaker>> = Array<Array>()
    
    var speakersAndModerators:Array<Speaker> = Array()
    var speakersAndModeratorsInSections:Array<Array<Speaker>> = Array<Array>()
    
    var loadedViaFile:Bool = false
    var loadedViaEvent:Bool = false
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //Taking Speakers only
        //loadViaEvent()
        //Taking Speakers and Moderators
        loadViaFile()
    }
    func loadViaFile() -> Void {
        let manager = FileManager.default
        let path = Bundle.main.path(forResource: "speakers", ofType: "txt")
        if(path != nil)
        {
            if(manager.fileExists(atPath: path!))
            {
                do
                {
                    let text = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
                    let segs = text.split(separator: "\n")
                    var index = 0
                    var name = ""
                    var title = ""
                    var photoFileName = ""
                    for seg in segs
                    {
                        let line = String(seg)
                        switch index % 4
                        {
                        case 0:
                            //name
                            name = line
                        case 1:
                            //title
                            title = line
                        case 2:
                            //photo name
                            photoFileName = line
                        case 3:
                            //All data is ready
                            speakersAndModerators.append(Speaker(name: name, title: title, profile_pic:UIImage(named: photoFileName)!))
                        default:
                            print("AMAZING\(index)")
                            //do nothing
                        }
                        index=index+1
                    }
                    
                    speakersAndModerators = sortByLastNameForSpeakers(AllSpeakers: speakersAndModerators)
                    
                    var namesPerSection:Array<Speaker> = Array()
                    for sp in speakersAndModerators
                    {
                        if(namesPerSection.isEmpty)
                        {
                            namesPerSection.append(sp)
                            lastnameInits.append(getLastnameInit(name: sp.name))
                        }
                        else
                        {
                            if(sameLastnameInit(sp1: sp, sp2: namesPerSection[0]))
                            {
                                namesPerSection.append(sp)
                            }
                            else
                            {
                                speakersAndModeratorsInSections.append(namesPerSection)
                                namesPerSection.removeAll()
                                namesPerSection.append(sp)
                                lastnameInits.append(getLastnameInit(name: sp.name))
                            }
                        }
                    }
                    if(!namesPerSection.isEmpty)
                    {
                        speakersAndModeratorsInSections.append(namesPerSection)
                    }
                    namesPerSection.removeAll()
                }
                catch let error as NSError
                {
                    print("There was an error\(error)")
                    loadViaEvent()
                }
            }
            else
            {
                print("error2")
                loadViaEvent()
            }
        }
        else
        {
            print("error1")
            loadViaEvent()
        }
        print("loadedViaFile")
        loadedViaFile = true
    }
    func sortByLastNameForSpeakers(AllSpeakers:Array<Speaker>) -> Array<Speaker> {
        var x = 0,y = 0;
        var lastnames:Array<String> = Array()
        var AllSpeakers2:Array<Speaker> = Array()
        
        for sp in AllSpeakers
        {
            lastnames.append(getLastName(speaker: sp))
            AllSpeakers2.append(sp)
        }
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
                    
                    let name = AllSpeakers2[x];
                    AllSpeakers2[x] = AllSpeakers2[y];
                    AllSpeakers2[y] = name;
                }
                y=y+1
            }
            x=x+1
        }
        return AllSpeakers2
    }
    func sameLastnameInit(sp1:Speaker,sp2:Speaker) -> Bool {
        return getLastnameInit(name: sp1.name) == getLastnameInit(name: sp2.name)
    }
    func getLastName(speaker:Speaker) -> String {
        return getLastname(name: speaker.name)
    }
    func getLastname(name:String) -> String {
        let segs = name.split(separator: " ");
        let lastname = String(segs[segs.count-1])
        return lastname
    }
    func getLastnameInit(name:String) -> String {
        let lastname = getLastname(name: name)
        let lastnameInit = Array(lastname)[0]
        return String(lastnameInit)
    }
    func loadViaEvent() -> Void {
        for events in schedules{
            for nameSS in (events.speakers?.split(separator: ","))!{
                
                let name = String(nameSS).trimmingCharacters(in: .whitespacesAndNewlines)
                if(!names.contains(name)){
                    names.append(name)
                }
            }
        }
        sortNamesByLastName()
        for namesecs in namesInSections
        {
            var secs:Array<Speaker> = Array()
            for name in namesecs
            {
                secs.append(Speaker(name: name, title: name, profile_pic: UIImage(named:"logo")!))
            }
            speakers.append(secs)
        }
        print("loadedViaEvent")
        loadedViaEvent = true
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
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return lastnameInits.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(loadedViaFile){
            return speakersAndModeratorsInSections[section].count
        }
        else if(loadedViaEvent)
        {
            return namesInSections[section].count
        }
        else
        {
            print("both methods failed")
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return lastnameInits[section]
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SpeakerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SpeakerTableViewCell", for: indexPath) as! SpeakerTableViewCell
        
        cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        //let Name = namesInSections[indexPath.section][indexPath.row]
        let sp = speakersAndModeratorsInSections[indexPath.section][indexPath.row]
        cell.nameLabel?.text = sp.name
        cell.titleLabel?.text = sp.title
        //cell.profileImage?.image = UIImage(named:Name)
        cell.profileImage.image = sp.profile_pic
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if(loadedViaFile)
        {
            let speaker:Speaker = speakersAndModeratorsInSections[indexPath.section][indexPath.row]
            let speakerViewController = EventLoader.generateSpeakerDetailViewController(speaker)
            self.navigationController!.pushViewController(speakerViewController, animated: true)
        }
        else if(loadedViaEvent)
        {
            let speaker:Speaker = speakers[indexPath.section][indexPath.row]
            let speakerViewController = EventLoader.generateSpeakerDetailViewController(speaker)
            self.navigationController!.pushViewController(speakerViewController, animated: true)
        }
        else
        {
            print("failed to load")
            return
        }
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return lastnameInits
    }
    
}

