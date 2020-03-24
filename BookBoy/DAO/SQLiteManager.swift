//
//  SQLiteManager.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/19.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation
import FMDB

class SQLiteManager: NSObject {
    private static let manager: SQLiteManager = SQLiteManager()
    private let dbName = "book.db"
    
    class func sharedManager() -> SQLiteManager {
        return manager
    }
    
    lazy var dbURL: URL = {
        let fileURL = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(dbName)
        return fileURL
    }()
    
    lazy var db: FMDatabase = {
        let database = FMDatabase(url: dbURL)
        return database
    }()
    
    lazy var dbQueue: FMDatabaseQueue? = {
        let databaseQueue = FMDatabaseQueue(url: dbURL)
        return databaseQueue
    }()
}
