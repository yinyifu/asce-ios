//
//  Database.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/28/17.
//  Copyright © 2017 tutorials. All rights reserved.
//
/*
 Needs improvement
 On SQL name columns :)
 */
import Foundation
import SQLite3
class Database : NSObject{
    private var dbFileName : String!;
    private var documentDir : String!;
    private var dbResult : Array<[String: Any]>! = [];
    private var arrColumnNames : Array<String>! = [];
    var affectedRows : Int32!;
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
        self.dbFileName = name
        self.copyDatabaseIntoDocumentsDirectory()
    }
    
    private func copyDatabaseIntoDocumentsDirectory(){
        
        let destinationPath : String = self.documentDir.stringByAppendingPathComponent(path: self.dbFileName!)
        if(!FileManager.default.fileExists(atPath: destinationPath)){
            let sourcePath : String = Bundle.main.resourcePath!.stringByAppendingPathComponent(path: self.dbFileName!)
            
            do{
                try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
                
            }catch{
                fatalError("File manager copy item failed")
            }
        }
    }
    /**
     
     To perform the sql operation from query and other information.
     - Author:
        Web Tutorials + Yifu Yin
     - Parameters:
        - query: User query that is either select all or select single column.
        - queryExe: true is query is SELECT, false otherwise
        - tablename: the name of table the user is selecting from.
     - Remark: Does not support multiple column select.
     
    */
    private func runQuery(query:String, queryExe: Bool, tablename : String){
        //empty database
        if(self.dbResult.count > 0){
            self.dbResult.removeAll()
        }
        if(self.arrColumnNames.count > 0){
            self.arrColumnNames.removeAll()
        }
        
        
        
        // open database
        var sqlDatabase : OpaquePointer?;
        let databasePath = Bundle.main.resourcePath!.stringByAppendingPathComponent(path: self.dbFileName!)
        
        let buffer : [CChar] = Array.init(databasePath.utf8CString);
        /*
        if(!databasePath.getCString(&buffer, maxLength: 1000, encoding: String.Encoding.utf8)){
            fatalError(Error.desciption)
        }*/
        if(sqlite3_open(buffer, &sqlDatabase) != SQLITE_OK){
            fatalError("SQL open error.")
        }
        // get the table names
        var columnStatement : OpaquePointer?
        var name_array : [String] = [];
        if(sqlite3_prepare_v2(sqlDatabase, "PRAGMA table_info(\(tablename))", -1, &columnStatement, nil) != SQLITE_OK){
            fatalError("SQL getting column names error.")
        }else{
            while(sqlite3_step(columnStatement) == SQLITE_ROW){
                let columnNameChars : UnsafePointer<UInt8>! = sqlite3_column_text(columnStatement, 1)
                let name = String.init(cString: columnNameChars)
                name_array.append(name)
           }
        }
        
        //prepare database
        var compiledStatement : OpaquePointer?
        if(sqlite3_prepare_v2(sqlDatabase, query, -1, &compiledStatement, nil) != SQLITE_OK){
            fatalError("SQL prepare error.")
        }
        
        //query
        if(!queryExe){
            var arrDataRow : [String : Any]!;
            
            while(sqlite3_step(compiledStatement) == SQLITE_ROW){
                arrDataRow = [:];
                let totalColumns = sqlite3_column_count(compiledStatement)
                for i in 0...totalColumns-1{
                    let type : Int32 = sqlite3_column_type(compiledStatement, i)
                    if(name_array.count != totalColumns && totalColumns != 1){
                        fatalError("Name array is different than database data!")
                    }
                    if(totalColumns == 1){
                        name_array = ["0"]
                    }
                    if(type == SQLITE_BLOB){
                        let size : Int32 = sqlite3_column_bytes(compiledStatement, i)
                        
                        let data : UnsafeRawPointer! = sqlite3_column_blob(compiledStatement, i)
                        if(data == nil){
                            fatalError("Database string as nil")
                        }
                        let blob : Data = Data.init(bytes: data, count: Int(size))
                        arrDataRow[name_array[Int(i)]] = blob
                        if(self.arrColumnNames.count != totalColumns){
                            self.arrColumnNames.append("profile_pic")
                        }
                    }else{
                    
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
    
    func loadDataFromDB(query:String, tname: String) -> Array<[String:Any]>{
        self.runQuery(query: query, queryExe: false, tablename: tname)
        return self.dbResult
    }
    func executeQuery(query:String, tname: String){
        self.runQuery(query: query, queryExe: true, tablename: tname)
    }
    
    
}
