//
//  EventLoader.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
class EventLoader{
    static var eventBundle:Bundle?;
    init(){
        let bundlePath :String = Bundle.main.path(forResource: Constants.BUNDLE_NAME , ofType: "bundle")!
        EventLoader.eventBundle = Bundle.init(path: bundlePath);
    }
    
    
}
