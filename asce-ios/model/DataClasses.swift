//
//  File.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation

class Schedule : NSObject{
    var scheduleId:Int = 0;
    var name:String = "testing";
    init(id: Int, name: String){
        super.init()
        self.scheduleId = id;
        self.name = name;
    }
}
struct ScheEvent{
    var name : String;
    var starttime: String;
    var endtime: String;
    var speakers : String?;
    var room : String?;
    var desc: String?;
    var mods : String?;
    var organizations : String;
    var date : String;
}
protocol EventScheProtocol
{
    func didSelectCell(eventCell : EventCell);
}
