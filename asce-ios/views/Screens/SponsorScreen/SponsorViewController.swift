//
//  SponsorViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit

class SponsorViewController : UITableViewController
{
    var titleN = ["Golden Sponsors","Silver Sponsors","Bronze Sponsors","ASCE"]
    var sponsorN = [["CHA","CPL","PARSONS"],["ASCEREGION1","FA","TC","USI"],["B_L","EJP","SEAS"],["2LINES","20120830","20130802","20131223","20161104"]]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sponsorN.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sponsorN[section].count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleN[section]
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SponsorTableViewCell", for: indexPath) as! SponsorTableViewCell
        cell.sponsorImage?.image = UIImage(named:sponsorN[indexPath.section][indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

