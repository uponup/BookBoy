//
//  Number+Swift.swift
//  
//
//  Created by wangyang on 2018/5/18.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation
import UIKit

public protocol _NumberValue {
    var number: NSNumber { get }
}

extension _NumberValue {
    
    public var chineseText: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: self.number)
    }
    
    //111111.2
    public func toMoneyString(omitted: Bool = false) -> String {
        let value = number.doubleValue
        if !omitted {
            return String(format: "%.2f", value)
        }
        let string = String(format: "%.2f", value)
        var finalString: String? = string
        if string.contains(".") {
            finalString = string.trimmingTailCharactersInSet(CharacterSet(charactersIn: "0"))
            finalString = finalString?.trimmingTailCharactersInSet(CharacterSet(charactersIn: "."))
        }
        if let string = finalString , !string.isEmpty {
            return string
        } else {
            return "0"
        }
    }
    
    //111,111.12
    public func toCommaMoneyString(needPerfix: Bool = false, omitted: Bool = false) -> String {
        if abs(number.doubleValue) < 0.0001 {
            return "0"
        }
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.currencyCode = ""
        formatter.currencySymbol = ""
        formatter.internationalCurrencySymbol = ""
        formatter.negativePrefix = "-"
        if needPerfix {
            formatter.positivePrefix = "+"
        } else {
            formatter.positivePrefix = ""
        }
        var string = formatter.string(from: number)
        string = string?.removeWhitespaceAndNewLine()
        
        if !omitted {
            if string.isEmpty {
                return "0.00"
            } else {
                return string!
            }
        }
        
        var finalString: String? = string
        if let str = string , str.contains(".") {
            finalString = str.trimmingTailCharactersInSet(CharacterSet(charactersIn: "0"))
            finalString = finalString?.trimmingTailCharactersInSet(CharacterSet(charactersIn: "."))
        }
        if let string = finalString , !string.isEmpty {
            return string
        } else {
            return "0"
        }
    }
    
    //1,111.1万
    public func toThumbMoneyString() -> String {
        if abs(number.doubleValue) < 0.0001 {
            return "0"
        }
        let intValue = Int(ceil(number.doubleValue))
        let absValue = abs(intValue)
        
        if absValue < 100000 {
            return intValue.toCommaMoneyString()
        } else if absValue < 100000000 {
            return (intValue / 10000).toCommaMoneyString() + "万"
        } else {
            return (intValue / 100000000).toCommaMoneyString() + "亿"
        }
    }
    
    public func toPercentString() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .percent
        formatter.positivePrefix = "+"
        return formatter.string(from: number)
    }
    
    public func toCGFloat() -> CGFloat {
        return CGFloat(number.floatValue)
    }
}

extension NSNumber: _NumberValue {
    public var number: NSNumber { return self }
}

extension Double: _NumberValue {
    public var number: NSNumber { return NSNumber(value: self) }
}

extension Float: _NumberValue {
    public var number: NSNumber { return NSNumber(value: self) }
}

extension Int: _NumberValue {
    public var number: NSNumber { return NSNumber(value: self) }
}

extension UInt: _NumberValue {
    public var number: NSNumber { return NSNumber(value: self) }
}
