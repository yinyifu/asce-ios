//
//  EmergencyViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/30/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class EmergencyViewController : UITableViewController{
    private let places = ["Hotel Location", "Nearest Hospital", "Poison Control Center", "Nearest CVS Pharmacy", "Nearest Rite Aid", "Conference Co-Chair", "Conference Co-Chair"]
    private let locations = ["Two Fountain Plaza, Buffalo, New York, USA, 14202\nGPS Address: 300 Pearl Street, Buffalo, New York 14202", "Buffalo General Medical Center - Kaleida Health\n100 High St.Buffalo, NY 14203", "219 Bryant St. Buffalo, NY 14222", "432 Main St. Buffalo, NY", "452 Main St. Buffalo, NY", "Francis Mahaney\nfmahaney@clarkpatterson.com", "Jason Havens\njhavens@clarkpatterson.com"]
    private let phone = ["(716) 856-1234", "(716) 859-5600", "(716) 878-7654", "(716) 856-4530", "(716) 854-4530", "(716) 994-0434", ""]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 50}
        else{
            return 75}
    }
    
    
}
