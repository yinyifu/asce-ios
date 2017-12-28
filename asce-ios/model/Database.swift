//
//  Database.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/28/17.
//  Copyright © 2017 tutorials. All rights reserved.
//

import Foundation
import SQLite3
class Database : NSObject{
    static var dbFileName : String?;
    static var documentDir : String?;
    override init() {
        super.init()
    }
        
    
    convenience init(withDBFileName name:String){
        self.init()
        let paths : Array = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        Database.documentDir = paths[0]
        Database.dbFileName = name;
        self.copyDatabaseIntoDocumentsDirectory();
    }
    func copyDatabaseIntoDocumentsDirectory(){
        if let dir = Database.documentDir{
            let destinationPath : String = dir.stringByAppendingPathComponent(path: Database.dbFileName!)
            if(!FileManager.default.fileExists(atPath: destinationPath)){
                let sourcePath : String = Bundle.main.resourcePath!.stringByAppendingPathComponent(path: Database.dbFileName!)
                do{
                    try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
                }catch{
                    print("File manager copy item failed")
                }
            }
        }
    }
}
