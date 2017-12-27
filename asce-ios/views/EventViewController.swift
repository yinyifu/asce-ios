//
//  TwitterViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import UIKit

class EventViewController : UITableViewController{
    
    private var scheduleName:String?;
    private var selectedIndexPath : NSIndexPath?;
    private var schedules:NSArray?;
    private var _selectedSchedule: Schedule?;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar();
        schedules = NSArray.init();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.selectCellForSelectedSchedule();
    }

    func selectCellForSelectedSchedule(){
        var row = 0;
        if((_selectedSchedule) != nil){
            for any in self.schedules!{
                let schedule:Schedule = any as! Schedule;
                row+=1;
                if(schedule.scheduleId == _selectedSchedule!.scheduleId){
                    break;
                }
            }
        }
        let selectedIndexPath = IndexPath.init(row: row, section: 0);
        self.tableView.selectRow(at: selectedIndexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
        self.tableView(self.tableView, didSelectRowAt: selectedIndexPath)
    }
    
    func setupNavigationBar(){
        let closeButton : UIBarButtonItem = UIBarButtonItem.init(title: "Close", style: UIBarButtonItemStyle.plain, target: self, action: Selector("EventViewController.closeController"));
        self.navigationItem.leftBarButtonItem = closeButton;
        self.navigationController!.navigationBar.barTintColor = UIColor.black
    }
    func closeController(){
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }

    
}
