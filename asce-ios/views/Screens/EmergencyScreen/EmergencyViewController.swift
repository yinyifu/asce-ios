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
    private let locations = ["Two Fountain Plaza, Buffalo, New York, USA, 14202\nGPS Address: 300 Pearl Street, Buffalo, New York 14202", "Buffalo General Medical Center - Kaleida Health\n100 High St.Buffalo, NY 14203", "219 Bryant St. Buffalo, NY 14222", "432 Main St. Buffalo, NY", "452 Main St. Buffalo, NY", "Francis Mahaney \nfmahaney@clarkpatterson.com", "Jason Havens\njhavens@clarkpatterson.com"]
    private let phone = ["(716) 856-1234", "(716) 859-5600", "(716) 878-7654", "(716) 856-4530", "(716) 854-4530", "(716) 994-0434", ""]
    private let number = ["7168561234", "7168595600", "7168787654", "7168564530", "7168544530", "7169940434", ""]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 2
        }else{
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.first!
        if(section == 0){
            if(indexPath.row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: "E1")!
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "E2")!
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                return cell
            }
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EMERGENCY") as! EmergencyCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.initData(self.locations[section-1], self.places[section-1], self.phone[section-1])
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.first!
        if(indexPath.first == 0){
            return 50
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EMERGENCY") as! EmergencyCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.initData(self.locations[section-1], self.places[section-1], self.phone[section-1])
            return cell.getHeight()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.first!
        if(section > 0){
            if(section < 7){
                let aa = self.places[section-1]
                let alert = UIAlertController.init(title: aa, message: "What to do?", preferredStyle: UIAlertControllerStyle.actionSheet)
                let action1 = UIAlertAction.init(title: "Call", style: UIAlertActionStyle.default){ (action : UIAlertAction!) in
                    let phoneNumber = self.number[section-1]
                    if let url = URL(string: "telprompt:\(phoneNumber)") {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }
                alert.addAction(action1)
                let action2 = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel){ (action : UIAlertAction!) in
                    self.dismiss(animated: true, completion: nil)
                }
                alert.addAction(action2)
                alert.modalPresentationStyle = UIModalPresentationStyle.popover
                if let popov = alert.popoverPresentationController{
                    popov.sourceView = UIButton()
                    popov.sourceRect = UIButton().bounds
                }
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
}
