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
    var sponsorN = ["B&L","CPL"]
    override func viewDidLoad() {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sponsorN.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SponsorTableViewCell", for: indexPath) as! SponsorTableViewCell
        let name = sponsorN[indexPath.row]
        cell.sponsorImage?.image = UIImage(named:name)
        return cell
    }
}
