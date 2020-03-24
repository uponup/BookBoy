//
//  Preference.swift

//  Created by wangyang on 2017/9/1.
//  Copyright © 2017年 All rights reserved.
//

import Foundation

public let preference = Preference.shared

public class Preference {
    public static let shared = Preference()
    
    fileprivate var dic: [String: Any] = [:] {
        didSet {
            save()
        }
    }
    private let fileManager = FileManager.default
    private let filePath: String
    private let identifier: String?
    
    public init(identifier: String? = nil) {
        self.identifier = identifier
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        var dir = path + "/com.tm.preference"
        if let identifier = identifier, !identifier.isEmpty {
            dir = dir + "/\(identifier)"
        }
        if !fileManager.fileExists(atPath: dir) {
            try? fileManager.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
        }
        filePath = dir + "/preference.plist"
        dic = (NSDictionary(contentsOfFile: filePath) as? [String: Any]) ?? [:]
    }
    
    private func save() {
        (dic as NSDictionary).write(toFile: filePath, atomically: true)
    }
    
}

extension Preference {
    
    public func hasKey(_ key: String) -> Bool {
        return object(forKey: key) != nil
    }
    
    public func set(_ object: Any?, forKey key: String) {
        dic[key] = object
    }
    
    public func object(forKey key: String) -> Any? {
        return dic[key]
    }
    
    public func string(forKey key: String) -> String? {
        return dic[key] as? String
    }
    
    public func int(forKey key: String) -> Int {
        return (dic[key] as? Int) ?? 0
    }
    
    public func float(forKey key: String) -> Float {
        return (dic[key] as? Float) ?? 0
    }
    
    public func double(forKey key: String) -> Double {
        return (dic[key] as? Double) ?? 0
    }
    
    public func bool(forKey key: String) -> Bool {
        return (dic[key] as? Bool) ?? false
    }
    
    public func dictionary(forKey key: String) -> [String: Any]? {
        return dic[key] as? [String: Any]
    }
    
    public func array(forKey key: String) -> [Any]? {
        return dic[key] as? [Any]
    }
    
    public func stringArray(forKey key: String) -> [String]? {
        return dic[key] as? [String]
    }
    
    public func dicArray(forKey key: String) -> [[String: Any]]? {
        return dic[key] as? [[String: Any]]
    }
    
    public subscript(key: String) -> Any? {
        get {
            return dic[key]
        }
        set {
            set(newValue, forKey: key)
        }
    }
}

