//
//  SpeakerViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit

class SpeakerViewController : UITableViewController, TableButtonDelegate
{   
    @objc func buttonClicked(at path: IndexPath) {
        let vc = EventLoader.generateSpeakerDetailViewController(self.returnSpeaker(at: path))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    struct lastnameStructure {
        var total : Int;
        var index : Int;
        var character : Character;
    }
    
    private var speakers : [Speaker]!
    private var initials : [Int : lastnameStructure]! = [:]
    
    func returnSpeaker(at path: IndexPath)->Speaker{
        let numbex = self.initials[path.first!]!.index + path.row
        return self.speakers[numbex]
    }
    
    override func viewDidLoad(){
        let query = "SELECT * from Speaker ORDER BY name ASC"
        self.speakers = EventLoader.getQuerySpeakers(query: query, tname: "Speaker")
        var last = self.speakers[0].name[0...0]
        var counter = 0
        var indextot = 0
        var struc : lastnameStructure = lastnameStructure(total: 0, index: indextot, character : last.first!)
        for speaker in self.speakers{
            
            let speklast = speaker.name[0...0]
            if(speklast != last){
                self.initials[counter] = struc
                struc = lastnameStructure(total: 0, index: indextot, character : speklast.first!)
                last = speklast
                counter += 1
           }
            indextot += 1
            struc.total += 1
        }
        self.initials[counter] = struc
        self.tableView.allowsSelection = true
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.initials.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.initials[section]!.total
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(self.initials[section]!.character)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SpeakerCell", owner: SpeakerCell.self, options: nil)![0] as! SpeakerCell
        cell.initDate(returnSpeaker(at: indexPath))
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.buttonClicked(at : indexPath);
    }
}
