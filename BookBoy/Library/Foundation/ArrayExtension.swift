//
//  ArrayExtension.swift
//  
//
//  Created by 飞流 on 2018/5/23.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation

extension Array {
    public var random: Element? {
        get {
            if self.isEmpty {
                return nil
            }
            let count = Int(UInt(self.count).random)
            return self[count]
        }
    }
    
    public func take(_ n: Int) -> Array {
        if count < n { return self }
        return Array(self[0..<n])
    }
    
    public func bubbleElement(fromIndex: Int, toIndex: Int) -> [Element] {
        if fromIndex >= self.count || toIndex >= self.count { return [] }
        var array = self
        let value = array.remove(at: fromIndex)
        array.insert(value, at: toIndex)
        return array
    }
}


extension Array where Element: Equatable {
    public func subtraction(with array: [Element]) -> [Element] {
        return self.filter { !array.contains($0) }
    }
    
    public func subtraction(with array: [Element], equalTest: (Element, Element) -> Bool) -> [Element] {
        return self.filter { (oldValue) in
            return !array.contains(where: { (value) in
                return equalTest(oldValue, value)
            })
        }
    }
    
    public func intersection(with array: [Element], equalTest: (Element, Element) -> Bool) -> [Element] {
        return self.filter { (oldValue) in
            return array.contains(where: { (value) in
                return equalTest(oldValue, value)
            })
        }
    }
}
