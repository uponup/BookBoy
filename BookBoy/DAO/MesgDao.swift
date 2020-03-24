//
//  MesgDao.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/21.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation

struct MesgDao {
    static func createTable() {
        // title, subtitle, body, date, type, read_state
        let sql = "CREATE TABLE IF NOT EXISTS MesgTable( id INTEGER PRIMARY KEY AUTOINCREMENT, title string, subtitle string, body text, type integer, read_state bool, create_date date)"
        let db = SQLiteManager.sharedManager().db
        if db.open() {
            if db.executeStatements(sql) {
                print("====创建表MesgTable成功")
            }else {
                print("====创建MesgTable失败")
            }
        }
    }
    
    //MARK:- 增 -
    static func addMesg(mesg: Mesg) {
        let sql = "INSERT INTO NoteTable(title, subtitle, body, type, read_state, create_date) VALUES (?, ?, ?, ?, ?, ?)"
        let db = SQLiteManager.sharedManager().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: [mesg.title, mesg.subTitle ?? "", mesg.body, mesg.type, mesg.readState, mesg.createDate]) {
                print("Mesg插入成功")
            }else {
                print("Mesg插入失败")
            }
        }
    }
    
    //MARK:- 查 -
    static func fetchAllMesgsWithType(_ type: MesgType) -> [Mesg] {
        let sql = "SELECT * FROM NoteTable WHERE type = ?"
        let db = SQLiteManager.sharedManager().db
        var mesgs: [Mesg] = []
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: [type]) {
                while res.next() {
                    var mesg = Mesg()
                    mesg.title = res.string(forColumn: "title")!
                    mesg.subTitle = res.string(forColumn: "subtitle")
                    mesg.body = res.string(forColumn: "body")!
                    mesg.type = MesgType(rawValue: Int(res.int(forColumn: "type")))!
                    mesg.readState = res.bool(forColumn: "read_state")
                    mesg.createDate = res.date(forColumn: "create_date")!
                    mesgs.append(mesg)
                }
            }
        }
        return mesgs
    }
    
    static func fetchLastOneWithType(_ type: MesgType) -> Mesg? {
        let sql = "SELECT * FROM NoteTable WHERE type = ? ORDER BY create_date ASC"
        let db = SQLiteManager.sharedManager().db
        var mesg: Mesg?
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: [type]) {
                var mesgs: [Mesg] = []
                while res.next() {
                    var mesg = Mesg()
                    mesg.title = res.string(forColumn: "title")!
                    mesg.subTitle = res.string(forColumn: "subtitle")
                    mesg.body = res.string(forColumn: "body")!
                    mesg.type = MesgType(rawValue: Int(res.int(forColumn: "type")))!
                    mesg.readState = res.bool(forColumn: "read_state")
                    mesg.createDate = res.date(forColumn: "create_date")!
                    mesgs.append(mesg)
                }
                mesg = mesgs.last
            }
        }
        return mesg
    }
}
