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
    
    var levels = ["Gold Sponsor","Silver Sponsor","Bronze Sponsor"]
    var sponsorN = [["CPL","PARSONS"],["ASCEREGION1","FA","TC","WATTS","USI"],["B_L","EJP","SEAS"]]
    
    var sponsorFullN = [["Clark Patterson Lee","Parsons Corporation"],["ASCE Region 1","Foit-Albert Associates","TenCate Geosynthetics","Watts Architecture and Engineering","United Survey Inc."],["Barton & Loguidice","Everett J. Prescott Inc.","UB School of Engineering and Applied Sciences"]]
    
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
        return "\(levels[section])s"
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SponsorTableViewCell", for: indexPath) as! SponsorTableViewCell
        cell.sponsorImage?.image = UIImage(named:sponsorN[indexPath.section][indexPath.row])
        cell.sponsorTitleLabel.text = sponsorFullN[indexPath.section][indexPath.row]
       // cell.sponsorLevelLabel.text = (levels[indexPath.section])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

