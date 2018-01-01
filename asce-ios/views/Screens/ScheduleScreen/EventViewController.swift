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
    private var columnCount : Int!;
    private var columnDatas : Array<[String:String]>!;
    private var dataAccordingToSection : Array<Array<ScheEvent>>!;
    override func viewDidLoad() {
        super.viewDidLoad()
        dataAccordingToSection = [];
        registerCells()
        
        //self.selectCellForSelectedSchedule();
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.registerCells()
    }
    func registerCells(){
        let classname :String = NSStringFromClass(EventCell.self)
        self.tableView.register(UINib.init(nibName: classname, bundle: nil), forCellReuseIdentifier: classname)
        let Columns = EventLoader.db.loadDataFromDB(query: "SELECT DISTINCT date FROM Event");
        self.columnCount = Columns.count
        self.columnDatas = Columns
        // do the column initialization here
        for i in 0...self.columnCount!-1{
            let temp = EventLoader.getQueryEvents(query: "SELECT * FROM Event WHERE date = '\(Columns[i]["0"]!)\'");
            self.dataAccordingToSection!.append(temp)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.columnCount;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataAccordingToSection[section].count;
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> EventCell {
        var patho = indexPath;
        let cell = Bundle.main.loadNibNamed("EventCell", owner: EventCell.self, options: nil)![0] as! EventCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        cell.tintColor = UIColor.white;
        cell.endLabel.text = self.schedules[patho.row ].endtime
        cell.startLabel.text = self.schedules[patho.row ].starttime
        cell.speakerLabel.text = self.schedules[patho.row ].speakers
        cell.date = self.schedules[patho.row].date
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
        let currentCell : EventCell = tableView.cellForRow(at: indexPath)! as! EventCell
        let date : String = currentCell.date!
        let time = currentCell.startLabel.text!
        let ary = EventLoader.db.loadDataFromDB(query: "SELECT * from Event WHERE date = \(date) and starttime = \(time)")
        
        print(ary)
        if(indexPath.row == 0){
            _selectedSchedule = nil;
        }else{
            _selectedSchedule = schedules[indexPath.row - 1];
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return super.tableView(tableView, viewForHeaderInSection: section)
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.columnDatas[section]["0"]
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
