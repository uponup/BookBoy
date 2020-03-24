//
//  BookDao.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/19.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation

struct BookDao {
    
    static func createTable() {
        
        let sql = "CREATE TABLE IF NOT EXISTS BookTable( id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, cover_img blob, author text, publisher text, price float, buy_url string, create_date date, is_complete bool)"
        let db = SQLiteManager.sharedManager().db
        if db.open() {
            if db.executeStatements(sql) {
                print("====创建表BookTable成功")
            }else {
                print("====创建BookTable失败")
            }
        }
    }
    
    static func addBook(book: Book) -> Bool {
        let sql = "INSERT INTO BookTable(title, cover_img, author, publisher, price, buy_url, create_date, is_complete) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        let db = SQLiteManager.sharedManager().db
        var completion: Bool = false
        
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: [book.title, book.coverImg.dataValue, book.author.stringValue, book.publisher.stringValue, book.price.doubleValue, book.buyUrl.stringValue, book.createDate, book.isComplete]) {
                completion = true
            }else {
                db.close()
                completion = false
            }
        }
        db.close()
        return completion
    }
    
    static func fetchAllBooks() -> [Book] {
        let sql = "SELECT * FROM BookTable";
        let db = SQLiteManager.sharedManager().db
        var books:[Book] = []
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: []) {
                while res.next() {
                    var book = Book()
                    book.id = Int(res.int(forColumn: "id"))
                    book.title = res.string(forColumn: "title")!
                    book.coverImg = res.data(forColumn: "cover_img")
                    book.author = res.string(forColumn: "author")
                    book.publisher = res.string(forColumn: "publisher")
                    book.price = res.double(forColumn: "price")
                    book.buyUrl = res.string(forColumn: "buy_url")
                    book.createDate = res.date(forColumn: "create_date")!
                    book.isComplete = res.bool(forColumn: "is_complete")
                    books.append(book)
                }
            }else {
                print("查询失败")
            }
        }
        return books
    }
    
    static func fetchBook(_ bookId: Int) -> Book? {
        let sql = "SELECT * FROM BookTable WHERE id = ?";
        let db = SQLiteManager.sharedManager().db
        var book: Book?
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: [bookId]) {
                while res.next() {
                    var temp = Book()
                    temp.id = Int(res.int(forColumn: "id"))
                    temp.title = res.string(forColumn: "title")!
                    temp.coverImg = res.data(forColumn: "cover_img")
                    temp.author = res.string(forColumn: "author")
                    temp.publisher = res.string(forColumn: "publisher")
                    temp.price = res.double(forColumn: "price")
                    temp.buyUrl = res.string(forColumn: "buy_url")
                    temp.createDate = res.date(forColumn: "create_date")!
                    temp.isComplete = res.bool(forColumn: "is_complete")
                    
                    book = temp
                }
            }else {
                print("查询失败")
            }
        }
        return book
    }
}
