//
//  EventLoader.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import UIKit

class EventLoader{
    static var eventBundle:Bundle?;
    static var favoriteEventColor:UIColor?;
    static var schedulee:Array<Schedule>?;
    static var schedulee2:Array<ScheEvent>?;
    static var db : Database = Database.init(withDBFileName: "ascedb.sql");
    init(){
        let colorId = "#659f65";
        EventLoader.favoriteEventColor = UIColor.color(fromHexString: colorId)
        let events = EventLoader.getQueryEvents(query: "SELECT * from Event;", tname: "Event");
        EventLoader.schedulee2 = events
        EventLoader.schedulee = Array()
        EventLoader.schedulee!.append(Schedule(id: 9, name: "testing"))
    }
    static func getQueryEvents(query : String, tname : String)->Array<ScheEvent>{
        let horray :Array<[String : String]> = EventLoader.db.loadDataFromDB(query: query, tname: tname) as! Array<[String : String]>
        var newRay = Array<ScheEvent>()
        for dict in horray{
            
            let newevent:ScheEvent = ScheEvent(name: dict["name"]!, starttime: dict["starttime"]!, endtime: dict["endtime"]!, speakers : dict["speakers"], room : dict["room"], desc: dict["desc"], mods: dict["mods"], organizations: dict["organizations"]!, date: dict["date"]!);
            newRay.append(newevent)
        }
        
        if(EventLoader.db.affectedRows != 0){
            print("query execute success");
            
        }else{
            fatalError("query execution failed");
        }
        return newRay;
    }
    static func getQuerySpeakers(query : String, tname : String)->Array<Speaker>{
        let horray : Array<[String : Any]> = EventLoader.db.loadDataFromDB(query: query, tname: tname)
        var newRay = Array<Speaker>()
        for dict in horray{
            if let imageData : Data = dict["profile_pic"]! as? Data{
                print(imageData)
                let image = UIImage.init(data: imageData)!
                let newevent:Speaker = Speaker(name: dict["name"]! as! String, title : dict["title"]! as! String, profile_pic : image);
                newRay.append(newevent)
            }else{
                fatalError("extract data failed")
            }
        }
        if(EventLoader.db.affectedRows != 0){
            print("query execute success");
            
        }else{
            fatalError("query execution failed");
        }
        return newRay;
    }
    static func generateEventDetailViewController(_ event: ScheEvent) -> EventDetailViewController{
        let sb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewController = sb.instantiateViewController(withIdentifier: "EventDetailStoryBoard") as! EventDetailViewController
        //let viewController = EventDetailViewController.init(event)
        viewController.initData(event)
        return viewController
    }
    
    static func generateSpeakerDetailViewController(_ speaker: Speaker) -> SpeakerDetailViewController{
        let sb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewController = sb.instantiateViewController(withIdentifier: "SpeakerDetailStoryBoard") as! SpeakerDetailViewController
        //let viewController = EventDetailViewController.init(event)
        viewController.initData(speaker: speaker)
        return viewController
    }
    static func getEventSpeakers(_ event: ScheEvent)->[Speaker]?{
        return nil
    }
    static func getSpeakerEvents(_ speaker: Speaker)->[ScheEvent]?{
        return nil
    }
}



public extension UIColor {
    public static func color(fromHexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(colorInteger(fromHexString: fromHexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    private static func colorInteger(fromHexString: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: fromHexString)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    var redValue: CGFloat{
        return cgColor.components! [0]
    }
    
    var greenValue: CGFloat{
        return cgColor.components! [1]
    }
    
    var blueValue: CGFloat{
        return cgColor.components! [2]
    }
    
    var alphaValue: CGFloat{
        return cgColor.components! [3]
    }
    
    // credits to @andreaantonioni for this addition
    var isWhiteText: Bool {
        let red = self.redValue * 255
        let green = self.greenValue * 255
        let blue = self.blueValue * 255
        
        // https://en.wikipedia.org/wiki/YIQ
        // https://24ways.org/2010/calculating-color-contrast/
        let yiq = ((red * 299) + (green * 587) + (blue * 114)) / 1000
        return yiq < 192
    }
}
public extension String {
    
    var lastPathComponent: String {
        
        get {
            return (self as NSString).lastPathComponent
        }
    }
    var pathExtension: String {
        
        get {
            
            return (self as NSString).pathExtension
        }
    }
    var stringByDeletingLastPathComponent: String {
        
        get {
            
            return (self as NSString).deletingLastPathComponent
        }
    }
    var stringByDeletingPathExtension: String {
        
        get {
            
            return (self as NSString).deletingPathExtension
        }
    }
    var pathComponents: [String] {
        
        get {
            
            return (self as NSString).pathComponents
        }
    }
    
    func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.appendingPathComponent(path)
    }
    
    func stringByAppendingPathExtension(ext: String) -> String? {
        
        let nsSt = self as NSString
        
        return nsSt.appendingPathExtension(ext)
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}
