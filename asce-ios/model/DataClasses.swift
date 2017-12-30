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
    var startTime: Date;
    var endTime: Date;
    var speaker : String;
    var room : String;
    var description: String;
    var moderator : String;
    var sponsors : String;
}
protocol EventScheProtocol
{
    func didSelectCell(eventCell : EventCell);
}
