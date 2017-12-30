//
//  TwitterViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Inspired by connfa!
//  http://connfa.com/
//  Copyright © 2017 tutorials. All rights reserved.
//  Not the ACTUAL VIew CONTROLLER!!

import UIKit

class MyScheduleViewController : UITableViewController{
    
    private var scheduleName:String?;
    private var selectedIndexPath : IndexPath?;
    private var schedules:Array<Schedule> = EventLoader.schedulee!;
    private var _selectedSchedule: Schedule?;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar();
        self.selectCellForSelectedSchedule();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }

    func selectCellForSelectedSchedule(){
        var row = 0;
        if((_selectedSchedule) != nil){
            for schedule in self.schedules{
                row+=1;
                if(schedule.scheduleId == _selectedSchedule!.scheduleId){
                    break;
                }
            }
        }
        self.selectedIndexPath = IndexPath.init(row: row, section: 0);
        self.tableView.selectRow(at: self.selectedIndexPath!, animated: false, scrollPosition: UITableViewScrollPosition.none)
        self.tableView(self.tableView, didSelectRowAt: self.selectedIndexPath!)
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
    
    //-------------- Overrides Table View
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1+self.schedules.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        cell.tintColor = EventLoader.favoriteEventColor!;
        
        if (indexPath.row == 0) {
            cell.textLabel?.text = "My Schedule"
        }else {
            let sharedSchedule : Schedule = (schedules[indexPath.row-1]);
            cell.textLabel?.text = sharedSchedule.name;
        }
        
        if(indexPath.row == selectedIndexPath!.row){
            cell.accessoryType = UITableViewCellAccessoryType.checkmark;
        }
        
        return cell;
    }
   
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell : UITableViewCell = tableView.cellForRow(at: indexPath)!
        currentCell.accessoryType = UITableViewCellAccessoryType.checkmark;
        
        scheduleName = currentCell.textLabel?.text;
        
        if(indexPath.row == 0){
            _selectedSchedule = nil;
        }else{
            _selectedSchedule = schedules[indexPath.row - 1];
        }
        
        if(selectedIndexPath!.row != indexPath.row){
            selectedIndexPath = indexPath;
            self.closeController();
        }
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let previous = tableView.cellForRow(at: indexPath)
        previous?.accessoryType = UITableViewCellAccessoryType.none
        previous?.tintColor = UIColor.black
    }
    
    
}
