//
//  Regular.swift
//  RealTimeCurrency
//
//  Created by 天明 on 2017/2/16.
//  Copyright © 2017年 天明. All rights reserved.
//
import Foundation

/// 正则验证
public enum Regular {
    public static func regexMach(content: String, pattern: String) -> [NSRange] {
        let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
        let res = regex.matches(in: content, options: NSRegularExpression.MatchingOptions.anchored, range: NSMakeRange(0, content.count))
        return res.map({ $0.range })
    }
}

extension Regular {
    /// 验证N位小数包括(1.) 且整数位限制N位
    public static func validNumberString(_ content: String, dotLimit: Int = 4, integerLimit: Int = 14) -> Bool {
        let pattern = "^[0-9]{1,\(integerLimit)}([.][0-9]{0,\(dotLimit)})?$"
        let res = regexMach(content: content, pattern: pattern)
        return res.count > 0
    }
    
    public static func validNegativeNumberString(_ content: String, dotLimit: Int = 4, integerLimit: Int = 14) -> Bool {
        let pattern = "^[-][0-9]{0,\(integerLimit)}([.][0-9]{0,\(dotLimit)})?$"
        let res = regexMach(content: content, pattern: pattern)
        return res.count > 0
    }
}


