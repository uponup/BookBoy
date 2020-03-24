//
//  MesgModel.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/21.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation

struct MessageCellModel {
    var type: MesgType = .system
    var title: String {
        return type.description
    }
    var detail: String?
}
