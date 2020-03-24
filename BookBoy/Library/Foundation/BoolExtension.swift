//
//  BoolExtension.swift
//  
//
//  Created by 飞流 on 2018/5/23.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation

extension Bool {
    @discardableResult
    public func doOnTrue(block: () -> Void) -> Bool {
        if self {
            block()
        }
        return self
    }
    
    @discardableResult
    public func doOnFalse(block: () -> Void) -> Bool {
        if !self {
            block()
        }
        return self
    }
}

