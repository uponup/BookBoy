//
//  Mesg.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/21.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation

struct Mesg {
    var title: String
    var subTitle: String?
    var body: String
    var createDate: Date
    var type: MesgType
    var readState: Bool = false
    
    init() {
        title = ""
        body = ""
        createDate = Date()
        type = .system
    }
}

// 系统通知
// 阅读统计
// 好书推荐
enum MesgType: Int, CustomStringConvertible {
    case ad = 0
    case analysis = 1
    case system = 2
    
    var description: String {
        switch self {
        case .ad:
            return NSLocalizedString("Recommend Read", comment: "")
        case .analysis:
            return NSLocalizedString("Read Analysis", comment: "")
        case .system:
            return NSLocalizedString("System Notification", comment: "")
        }
    }
}
