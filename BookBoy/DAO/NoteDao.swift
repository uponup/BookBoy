//
//  NoteDao.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/19.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation

struct NoteDao {
    static func createTable() {
        let sql = "CREATE TABLE IF NOT EXISTS NoteTable( id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, img blob, book_id integer, update_date date);"
        let db = SQLiteManager.sharedManager().db
        if db.open() {
            if db.executeStatements(sql) {
                print("====创建表NoteTable成功")
            }else {
                print("====创建NoteTable失败")
            }
        }
    }
    
    //MARK:- 增 -
    static func addNote(note: Note) {
        let sql = "INSERT INTO NoteTable(title, content, book_id, update_date, img) VALUES (?, ?, ?, ?, ?);"
        let db = SQLiteManager.sharedManager().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: [note.title, note.content, note.bookId, note.updateDate, note.img as Any, note.isComplete]) {
                print("插入成功")
            }else {
                print("插入失败")
            }
        }
    }
    
    //MARK:- 改 -
    static func updateNote(note: Note) {
        let sql = "UPDATE NoteTable SET title = ?, content = ?, update_date = ? WHERE id = ?"
        let db = SQLiteManager.sharedManager().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: [note.title, note.content, note.updateDate, note.id]) {
                print("修改成功")
            }else {
                print("修改失败")
            }
        }
    }
    
    //MARK:- 查 -
    static func fetchAllNotes() -> [Note] {
        let sql = "SELECT * FROM NoteTable;"
        let db = SQLiteManager.sharedManager().db
        var notes:[Note] = []
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: []) {
                while res.next() {
                    var note = Note()
                    note.id = Int(res.int(forColumn: "id"))
                    note.title = res.string(forColumn: "title")!
                    note.content = res.string(forColumn: "content")!
                    note.bookId = Int(res.int(forColumn: "book_id"))
                    note.img = res.data(forColumn: "img")
                    note.updateDate = res.date(forColumn: "update_date")!
                    notes.append(note)
                }
            }else {
                print("查询失败")
            }
        }
        return notes
    }
    
    static func isExistNote(_ noteId: Int) -> Bool {
        let sql = "SELECT * FROM NoteTable WHERE book_id = ?;"
        let db = SQLiteManager.sharedManager().db
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: [noteId]) {
                while res.next() {
                    return true
                }
            }else {
                return false
            }
        }
        return false
    }
    
    static func fetchNote(_ bookId: Int) -> [Note] {
        let sql = "SELECT * FROM NoteTable WHERE book_id = ?;"
        let db = SQLiteManager.sharedManager().db
        var notes: [Note] = []
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: [bookId]) {
                while res.next() {
                    var note = Note()
                    note.id = Int(res.int(forColumn: "id"))
                    note.title = res.string(forColumn: "title")!
                    note.content = res.string(forColumn: "content")!
                    note.bookId = Int(res.int(forColumn: "book_id"))
                    note.img = res.data(forColumn: "img")
                    note.updateDate = res.date(forColumn: "update_date")!
                    notes.append(note)
                }
            }else {
                print("查询\(bookId)失败")
            }
        }
        return notes
    }
}
