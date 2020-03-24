//
//  Book.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/19.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Book {
    var id: Int = 0
    var title: String = ""
    var coverImg: Data?
    var coverImgName: String = ""
    var author: String?
    var publisher: String?
    var price: Double?
    var buyUrl: String?
    var createDate: Date = Date()
    var isComplete: Bool = false
    
    init() {
        title = ""
        coverImg = nil
        author = nil
        publisher = nil
        price = nil
        buyUrl = nil
    }
    
    init(title: String) {
        self.title = title
        coverImg = nil
        author = nil
        publisher = nil
        price = nil
        buyUrl = nil
    }
        
    static func add() -> Book {
        var book = Book()
        book.title = NSLocalizedString("Add a New Book", comment: "")
        book.coverImgName = "cell_book_mark"
        return book
    }
}
