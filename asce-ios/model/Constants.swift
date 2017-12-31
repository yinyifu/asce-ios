//
//  Constants.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import UIKit

struct Constants {
    //resource bundle name
    static let BUNDLE_NAME = "DC-Theme";
    
    //events property
    static let kFavoriteEventColour = "FavoriteEventColour";
    static let defaultEventColour = UIColor.black
    static let eventCellSubtitleHeight = 16;
    static let eventCellImageHeight = 16;
    static let hashtagHeightOffset = 4;
    
    // left button property
    static let leftButtonEnabledColor = UIColor.init(white: 245.0/255.0, alpha: 1.0)
    static let leftButtonDisabledColor = UIColor.init(white: 229.0/255.0, alpha: 1.0)
    
    //database constants
    static let nameArray = ["date", "starttime", "endtime", "speakers", "room", "name", "desc", "mods", "organizations"]
}


