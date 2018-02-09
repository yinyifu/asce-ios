//
//  GlobalMapView.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/8/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit
import CoreLocation
class GlobalMapViewController: UITableViewController{
    
    private var locations : [CLLocationCoordinate2D] = [CLLocationCoordinate2D.init(latitude: 42.888038, longitude: -78.8775945), CLLocationCoordinate2D.init(latitude: 42.8810499, longitude: -78.8774038), CLLocationCoordinate2D.init(latitude: 42.9361235, longitude: -78.848033)]
    private var namesForPlace : [String] = ["Hyatt Regency Buffalo", "Pearl St. Grill & Brewery" , "Greatbatch Pavilion / Darwin Martin House Complex"]
    private var calla : [[String]] = [["1-800-633-7313", "716-856-1234"], ["716-856-2337"], ["716-856-3858"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        let display = UIImage.init(cgImage: (UIImage.init(named: "door")?.cgImage)!, scale: 1.7, orientation: UIImageOrientation.down)
        self.tabBarItem.image = display
        self.tabBarItem.title = "Locations"
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "location\(indexPath.row+1)", for: indexPath) 
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        cell.tintColor = UIColor.white;
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 179
        }else if(indexPath.row == 1){
            return 114
        }
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let loc = locations[indexPath.row]
        let name = namesForPlace[indexPath.row]
        let number = calla[indexPath.row]
        self.tableView.deselectRow(at: indexPath, animated: false)
        self.openAlertForDirection(locc: loc, name: name, numbers:number)
        return 
    }
    func openAlertForDirection(locc : CLLocationCoordinate2D , name : String, numbers:[String]){
        let alert = UIAlertController.init(title: name, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let action1 = UIAlertAction.init(title: "Show \(name) on Map", style: UIAlertActionStyle.default){ (action : UIAlertAction!) in
            EventLoader.openMapForPlace(coordinates: locc, name: name)
        }
        alert.addAction(action1)
        for number in numbers{
            alert.addAction(UIAlertAction.init(title: "Call \(number)", style: UIAlertActionStyle.default){ (action : UIAlertAction!) in
                EventLoader.callNumber(number: number.replacingOccurrences(of: "-", with: ""))
            })
        }
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
