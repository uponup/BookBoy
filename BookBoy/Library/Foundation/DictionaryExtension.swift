//
//  DictionaryExtension.swift
//  
//
//  Created by 飞流 on 2018/5/22.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    public func toUrlString() -> String {
        var array: [String] = []
        self.forEach { (key, value) in
            array.append("\(key)=\(value)")
        }
        return array.joined(separator: "&")
    }
}
