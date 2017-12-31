//
//  EventViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import UIKit

class EventViewController : UITableViewController{
    private var scheduleName:String?;
    private var selectedIndexPath : IndexPath?;
    private var schedules = EventLoader.schedulee2!;
    private var _selectedSchedule: ScheEvent?;
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        //self.selectCellForSelectedSchedule();
    }
    /*
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
 */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerCells()
    }
    func registerCells(){
        let classname :String = NSStringFromClass(EventCell.self)
        self.tableView.register(UINib.init(nibName: classname, bundle: nil), forCellReuseIdentifier: classname)
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.schedules.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var patho = indexPath;
        let cell = Bundle.main.loadNibNamed("EventCell", owner: EventCell.self, options: nil)![0] as! EventCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        cell.tintColor = EventLoader.favoriteEventColor!;
        print(patho)
        cell.endLabel.text = self.schedules[patho.row ].endtime
        cell.startLabel.text = self.schedules[patho.row ].starttime
        cell.speakerLabel.text = self.schedules[patho.row ].speakers
        if(self.schedules[patho.row ].speakers == ""){
            cell.speakerLabel.text = "n/a"
        }
        cell.titleLabel.text = self.schedules[patho.row ].name
        cell.locationLabel.text = self.schedules[patho.row ].room
                
        /*if(indexPath.row == selectedIndexPath!.row){
            cell.accessoryType = UITableViewCellAccessoryType.checkmark;
        }*/
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell : UITableViewCell = tableView.cellForRow(at: indexPath)!
        currentCell.accessoryType = UITableViewCellAccessoryType.checkmark;
        
        
        
        if(indexPath.row == 0){
            _selectedSchedule = nil;
        }else{
            _selectedSchedule = schedules[indexPath.row - 1];
        }
        /*
        if(selectedIndexPath!.row != indexPath.row){
            selectedIndexPath = indexPath;
            self.closeController();
        }*/
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let previous = tableView.cellForRow(at: indexPath)
        previous?.accessoryType = UITableViewCellAccessoryType.none
        previous?.tintColor = UIColor.black
    }
    func closeController(){
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
