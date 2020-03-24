//
//  Note.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/19.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Note {
    var id: Int = 0
    var title: String
    var content: String
    var bookId: Int = 0
    var img: Data?
    var isComplete: Bool
    var updateDate: Date
    
    init() {
        title = ""
        content = ""
        img = nil
        isComplete = false
        updateDate = Date()
    }
    
    static func test() -> Note {
        var note = Note()
        note.title = "笔记标题，精华"
        note.content = "家具山东i温和，清洁完克拉建设单位合法啊看浑善达克就不能从i我企鹅"
        return note
    }
}
