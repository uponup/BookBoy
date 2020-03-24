//
//  String+Swift.swift
//  
//
//  Created by wangyang on 2018/5/18.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 类型转换
extension String {
    public func toUrl() -> URL? {
        return URL(string: self)
    }
    
    public func toDate(with formatString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = formatString
        formatter.timeZone = TimeZone.current
        return formatter.date(from: self)
    }
    
    public func toDouble() -> Double {
        return Double(self) ?? 0
    }
    
    public func toInt() -> Int {
        return Int(self.toDouble())
    }
}

// MARK: - 比较版本号
extension String {
    public func versionCompare(with other: String) -> ComparisonResult {
        let oneComponents = self.components(separatedBy: ".")
        let twoComponents = other.components(separatedBy: ".")
        for (index, obj) in oneComponents.enumerated() {
            if index < twoComponents.count {
                if obj.toInt() > twoComponents[index].toInt() {
                    return .orderedDescending
                    
                } else if obj.toInt() == twoComponents[index].toInt() {
                    if index == oneComponents.count - 1 {
                        if index == twoComponents.count - 1 {
                            return .orderedSame
                        } else {
                            return .orderedAscending
                        }
                    }
                } else {
                    return .orderedAscending
                }
            } else {
                if obj.toInt() == 0 {
                    return .orderedSame
                } else {
                    return .orderedDescending
                }
            }
        }
        return .orderedSame
    }
}
// MARK: - 对String的操作整理
extension String {
    
    public func adjustWidth(_ width: CGFloat, font: UIFont) -> String {
        let moreWidth = "...".width(with: font)
        var preIndex = 0
        var index = 0
        var length: CGFloat = 0
        for c in self {
            length += "\(c)".width(with: font)
            if length > (width - moreWidth) && preIndex == 0 {
                preIndex = index
            }
            if length > width {
                break
            }
            index += 1
        }
        if index == self.count {
            return self
        } else {
            return self.prefix(preIndex).toString() + "..."
        }
    }

    public func removeWhitespaceAndNewLine() -> String {
        var string = replacingOccurrences(of: " ", with: "")
        string = string.replacingOccurrences(of: "\r", with: "")
        string = string.replacingOccurrences(of: "\n", with: "")
        return string
    }
    
    public func removePunctuation() -> String {
        let regex = try? NSRegularExpression(pattern: "[\\p{Punct}\\p{Space}]+", options: .caseInsensitive)
        return regex?.stringByReplacingMatches(in: self, options: [], range: NSRange.init(location: 0, length: count), withTemplate: "") ?? ""
    }

    public func trimmingTailCharactersInSet(_ set: CharacterSet) -> String {
        var utf16View: String.UTF16View = utf16
        for uchar in utf16.reversed() {
            if set.contains(UnicodeScalar(uchar)!) {
                utf16View = String(Substring(utf16View.dropLast())).utf16
            } else {
                break
            }
        }
        return String(describing: utf16View)
    }
    
    public func insert(separator: String, everyCharCount charCount: Int) -> String {
        if charCount == 0 { return self }
        var insertedString = ""
        var index = 0
        while index + charCount < count {
            insertedString += self[index..<(index + charCount)]
            insertedString += separator
            index += charCount
        }
        insertedString += self[index..<count]
        return insertedString
    }
    
    public func appendUrlParameterFormatString(of dictionary: [String: String]) -> String {
        if dictionary.count > 0 {
            let paramsString = dictionary.toUrlString()
            if self.contains("?") {
                return self + "&\(paramsString)"
            } else {
                return self + "?\(paramsString)"
            }
        } else {
            return self
        }
    }
    
    public func toMoneyString() -> String {
        if let doubleValue = Double(self) {
            return doubleValue.toMoneyString(omitted: true)
        }
        return 0.toMoneyString()
    }
    
    public func bid() -> String {
        let str = self.removeHtmlTags()
        if let range = str.range(of: " file:") {
            return str[str.startIndex..<range.lowerBound].toString()
        }
        return self
    }
    
    public func components(separatedComponentByLength length: Int) -> [String] {
        if length < 1 { return [] }
        var separatedArray: [String] = []
        var index = 0
        while index + length < count {
            separatedArray.append(self[index..<(index + length)] )
            index += length
        }
        separatedArray.append(self[index..<count] )
        return separatedArray
    }
}

// MARK: - 电话相关
extension String {
    public var isMobilePhone: Bool {
        guard let regex = try? NSRegularExpression(pattern: "^1[\\d\\*]{10}$", options: .caseInsensitive) else { return false }
        let numberOfMatches = regex.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        return numberOfMatches == 1
    }
    
    public func getPhoneNumbers() -> [String] {
        guard let regex = try? NSRegularExpression(pattern: "[^0-9/-]+", options: []) else { return [] }
        let string = regex.stringByReplacingMatches(in: self, options: [], range: NSRange.init(location: 0, length: self.count), withTemplate: "/")
        let phones = string.components(separatedBy: "/")
        var rst: [String] = []
        var codeString = ""
        phones.forEach {
            var phone = $0
            if !phone.isMobilePhone {
                guard let regex = try? NSRegularExpression(pattern: "\\d{3,4}\\-", options: .caseInsensitive) else { return }
                if let rst = regex.firstMatch(in: phone, options: [], range: NSRange.init(location: 0, length: phone.count)) {
                    codeString = phone[rst.range.lowerBound..<rst.range.upperBound]
                } else {
                    if codeString.count > 0 {
                        phone = codeString + phone
                    }
                }
            }
            if phone.count >= 3 {
                rst.append(phone)
            }
        }
        return rst
    }
    
    public func getMobilePhoneNumbers() -> [String] {
        let string = self.replacingOccurrences(of: "-", with: "")
        guard let regex = try? NSRegularExpression(pattern: "1[\\d]{10}$", options: .caseInsensitive) else { return [] }
        let matches = regex.matches(in: string, options: .reportCompletion, range: NSRange.init(location: 0, length: string.count))
        return matches.map { string[$0.range.lowerBound..<$0.range.upperBound] }
    }

}

// MARK: - 网络相关
extension String {
    public func encodeUrl() -> String {
        let set = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]").inverted
        return self.addingPercentEncoding(withAllowedCharacters: set) ?? ""
    }
    
    public func decodeUrl() -> String {
        return self.removingPercentEncoding ?? ""
    }
    
    public func decodeHtml() -> String {
        let attributedString = try? NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        return attributedString?.string ?? ""
    }
    
    public func removeHtmlTags() -> String {
        let componentsToKeep = self.componentsByRemovingHtmlTags()
        let plainText = componentsToKeep.joined(separator: ",").trimmingCharacters(in: .whitespacesAndNewlines)
        return plainText
    }
    
    public func componentsByRemovingHtmlTags() -> [String] {
        let components = self.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: CharacterSet.init(charactersIn: "<>"))
        var componentsToKeep: [String] = []
        var index = 0
        while index < components.count {
            let component = components[index]
            let c = component.trimmingCharacters(in: .whitespacesAndNewlines)
            if c.count > 0 {
                componentsToKeep.append(c)
            }
            index += 2
        }
        return componentsToKeep
    }
    
    public func getUrlParameter() -> String {
        if let index = self.range(of: "?")?.upperBound {
            return self[index...].toString()
        } else {
            return self
        }
    }
    
    public func toDictionaryByParseInUrlParameterFormat() -> [String: String] {
        return self.getUrlParameter().components(separatedBy: "&").reduce([ : ]) { (rst, str) in
            var result = rst
            let keyAndValue = str.components(separatedBy: "=")
            if keyAndValue.count == 2 {
                result[keyAndValue[0]] = keyAndValue[1]
            }
            return result
        }
    }
}

// MARK: - String的一些值
extension String {
    public var pointer: UnsafePointer<Int8>? {
        return (self as NSString).utf8String
    }
    
    public var hashCode: Int {
        return Int(unicodeScalars.reduce(0) {
            ($0 << 5) &- $0 &+ $1.value
        })
    }
//     向上取整，避免layout设置宽的时候出现问题，
    public func width(with font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: 40)
        let boundingBox = (self as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }

    public func height(with width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = (self as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}

// MARK: - 快速获取特定的字符串
extension String {
    public static func random(_ length: UInt) -> String {
        var str = ""
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        for _ in (0..<length) {
            str.append(charSet[Int(arc4random() % 62)])
        }
        return str
    }
}

// MARK: - 根据角标截、取字符串
extension String {
    public subscript (range: CountableRange<Int>) -> String {
        get {
            if self.count < range.upperBound { return "" }
            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
            return self[startIndex..<endIndex].toString()
        }
        set {
            if self.count < range.upperBound { return }
            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
            self.replaceSubrange(startIndex..<endIndex, with: newValue)
        }
    }
    
    public subscript (range: CountableClosedRange<Int>) -> String {
        get {
            return self[range.lowerBound..<(range.upperBound + 1)]
        }
        set {
            self[range.lowerBound..<(range.upperBound + 1)] = newValue
        }
    }
    
    public subscript (index: Int) -> String {
        get {
            guard index < count else { return "" }
            let str = self[self.index(startIndex, offsetBy: index)]
            return String(str)
        }
        set {
            self[index...index] = newValue
        }
    }
}

// MARK: - 对字符串的判断
extension String {
    public var isEmail: Bool {
        let emailRegEx =
            "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
                + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
                + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
                + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
                + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
                + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
                + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let regExPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return regExPredicate.evaluate(with: self.lowercased())
    }
    
    public var isAllChinese: Bool {
        for c in self {
            if ("\u{4E00}" > c  || c > "\u{9FA5}") {
                return false
            }
        }
        return true
    }
    
    public func fuzzyMatching(withPattern pattern: String) -> Bool {
        if pattern.isEmpty { return true }
        let targetStr = pattern[0]
        if let range = self.range(of: targetStr) {
            let startIndex = self.index(range.lowerBound, offsetBy: 1)
            let behindStr = self[startIndex...].toString()
            if behindStr.count >= pattern.count - 1 {
                return behindStr.fuzzyMatching(withPattern: pattern.dropFirst().toString())
            }
        }
        return false
    }
}

extension Substring {    
    public func toString() -> String {
        return String(self)
    }
}
