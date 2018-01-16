//
//  EventViewController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import UIKit

class EventViewController : UITableViewController, TableButtonDelegate {
    func backClicked() {
        self.navigationController?.show(self, sender: self)
    }
    
    func buttonClicked(at path: IndexPath) {
        let eventViewController = EventLoader.generateEventDetailViewController(self.dataAccordingToSection[path.first!][path.row])
        self.navigationController!.pushViewController(eventViewController, animated: true)
    }
    
    private var scheduleName:String?;
    private var selectedIndexPath : IndexPath?;
    private var _selectedSchedule: ScheEvent?;
    private var columnCount : Int!;
    private var columnDatas : Array<[String:String]>!;
    private var dataAccordingToSection : Array<Array<ScheEvent>>!;
    private var mainView : UIView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        dataAccordingToSection = [];
        registerCells()
        self.mainView = self.view;
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.registerCells()
    }
    func registerCells(){
        let classname :String = NSStringFromClass(EventCell.self)
        self.tableView.register(UINib.init(nibName: classname, bundle: nil), forCellReuseIdentifier: classname)
        let Columns = EventLoader.db.loadDataFromDB(query: "SELECT DISTINCT date FROM Event", tname: "Event") as! [[String : String]];
        self.columnCount = Columns.count
        self.columnDatas = Columns
        // do the column initialization here
        for i in 0...self.columnCount!-1{
            let temp = EventLoader.getQueryEvents(query: "SELECT * FROM Event WHERE date = '\(Columns[i]["0"]!)\'", tname: "Event");
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
        let section = indexPath.first!
        let cell = Bundle.main.loadNibNamed("EventCell", owner: EventCell.self, options: nil)![0] as! EventCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        cell.tintColor = UIColor.white;
        
        let thisEvent = self.dataAccordingToSection[section][indexPath.row];
        cell.initData(thisEvent, indexPath, self)
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell : EventCell = tableView.cellForRow(at: indexPath)! as! EventCell
        let date : String = currentCell.date!
        let time = currentCell.startLabel.text!
        let ary = EventLoader.db.loadDataFromDB(query: "SELECT * from Event WHERE date = '\(date)' and starttime = '\(time)'", tname: "Event")
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.columnDatas[section]["0"]
    }
    func closeController(){
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
