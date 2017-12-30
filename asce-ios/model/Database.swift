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
    private var dbFileName : String!;
    private var documentDir : String!;
    private var dbResult : Array<[String: String]>! = [];
    private var arrColumnNames : Array<String>! = [];
    private var affectedRows : Int32!;
    private var lastInsertedId: Int64!;
    
    override init() {
        super.init()
    }
    
    convenience init(withDBFileName name:String){
        self.init()
        let paths : Array = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        if(paths.count == 0){
            fatalError("Error! Document directory not found.")
        }
        self.documentDir = paths[0]
        self.dbFileName = name;
        self.copyDatabaseIntoDocumentsDirectory();
    }
    
    private func copyDatabaseIntoDocumentsDirectory(){
        
        let destinationPath : String = self.documentDir.stringByAppendingPathComponent(path: self.dbFileName!)
        if(!FileManager.default.fileExists(atPath: destinationPath)){
            let sourcePath : String = Bundle.main.resourcePath!.stringByAppendingPathComponent(path: self.dbFileName!)
            do{
                try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
                
            }catch{
                print("File manager copy item failed")
            }
        }
    }

    private func runQuery(query:String, queryExe: Bool, name_array : Array<String>){
        //empty database
        if(self.dbResult.count > 0){
            self.dbResult.removeAll()
        }
        if(self.arrColumnNames.count > 0){
            self.arrColumnNames.removeAll()
        }
        
        // open database
        var sqlDatabase : OpaquePointer?;
        let databasePath = self.documentDir.stringByAppendingPathComponent(path: self.dbFileName)
        var buffer : [CChar] = [];
        
        if(!databasePath.getCString(&buffer, maxLength: 100, encoding: String.Encoding.utf8)){
            fatalError("Convert C String Error.")
        }
        if(sqlite3_open(buffer, &sqlDatabase) != SQLITE_OK){
            fatalError("SQL open error.")
        }
        
        //prepare database
        var compiledStatement : OpaquePointer?
        if(sqlite3_prepare_v2(sqlDatabase, query, -1, &compiledStatement, nil) != SQLITE_OK){
            fatalError("SQL prepare error.")
        }
        
        //query
        if(queryExe){
            var arrDataRow : [String : String]!;
            while(sqlite3_step(compiledStatement) == SQLITE_ROW){
                arrDataRow = [:];
                let totalColumns = sqlite3_column_count(compiledStatement)
                for i in 0...totalColumns{
                    
                    if(name_array.count != totalColumns){
                        fatalError("Name array is different than database data!")
                    }
                    
                    let dbDataAsChars : UnsafePointer<UInt8>! = sqlite3_column_text(compiledStatement, i)
                    
                    if(dbDataAsChars == nil){
                        fatalError("Database string as nil")
                    }
                    
                    let result = String.init(cString: dbDataAsChars)
                    arrDataRow[name_array[Int(i)]] = result
                    if(self.arrColumnNames.count != totalColumns){
                        self.arrColumnNames.append(result)
                    }
                }
                if(arrDataRow.count > 0){
                    self.dbResult.append(arrDataRow)
                }
            }
        }else{
            // non query data muniplication
            if(sqlite3_step(compiledStatement) != SQLITE_DONE){
                fatalError("can note step database for non query")
            }
            self.affectedRows = sqlite3_changes(sqlDatabase)
            self.lastInsertedId = sqlite3_last_insert_rowid(sqlDatabase)
            
        }
        sqlite3_finalize(compiledStatement)
        sqlite3_close_v2(sqlDatabase)
    }
    
    func loadDataFromDB(query:String) -> Array<[String:String]>{
        self.runQuery(query: query, queryExe: false, name_array: Constants.nameArray)
        return self.dbResult
    }
    func executeQuery(query:String){
        self.runQuery(query: query, queryExe: true, name_array: Constants.nameArray)
    }
}
