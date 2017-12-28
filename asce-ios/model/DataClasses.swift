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
class ScheEvent : NSObject{
    var tracks = ["name": "tracks"]
}
protocol EventScheProtocol
{
    func didSelectCell(eventCell : EventCell);
}
