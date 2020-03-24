//
//  IntExtension.swift
//  
//
//  Created by 飞流 on 2018/5/23.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation

extension UInt {
    public var random: UInt {
        return UInt(arc4random_uniform(UInt32(self)))
    }
}
