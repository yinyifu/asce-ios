//
//  HomeViewController.swift
//  asce-ios
//
//  Created by Baicheng Chen on 12/26/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : UITableViewController
{
    
    lazy var descriptionText : String = "Get access to civil engineering’s leading experts and information through our many conferences--from the ASCE Convention to specialized technical and leadership conferences. These are the perfect platforms to exchange ideas, meet a diverse group of colleagues, participate in discussions, earn the latest innovations in your field, and earn professional development hours (PDHs), all at members-only discounts."
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 2
            case 1:
                return 2
            case 2:
                return 2
            default:
                return 1
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.first!
        switch section {
        case 0:
            if(indexPath.row == 0){
                return 150
            }else{
                let cell = Bundle.main.loadNibNamed("DescriptionCell", owner: DescriptionCell.self, options: nil)![0] as! DescriptionCell
                return cell.heightForCell(withText: self.descriptionText)
            }
        case 1:
            if(indexPath.row == 0){
                return 45
            }else{
                return 85
            }
        case 2:
            if(indexPath.row == 0){
                return 45
            }else{
                return 85
            }
        default:
            return 224.5
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.first!
        switch section {
        case 0:
            if(indexPath.row == 0){
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "homeImage")!
                return cell;
            }else{
                let cell = Bundle.main.loadNibNamed("DescriptionCell", owner: DescriptionCell.self, options: nil)![0] as! DescriptionCell
                cell.initData(self.descriptionText)
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.isUserInteractionEnabled = false
                return cell;
            }
        case 1:
            if(indexPath.row == 0){
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "upcomeEventName")!
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                return cell;
            }else{
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "upcomeEventCell")!
                return cell;
            }
        case 2:
            if(indexPath.row == 0){
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "myEventName")!
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                return cell;
            }else{
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "myEventCell")!
                return cell;
            }
        default:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "contactInfoCell")!
            return cell;
        }
    }
}
