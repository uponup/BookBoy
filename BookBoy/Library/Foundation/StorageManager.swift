//
// 
//
//
//  Created by 飞流 on 2018/9/17.
//  Copyright © 2018年 飞流. All rights reserved.
//

import UIKit

@objc (BaseStorageManager)
open class BaseStorageManager: NSObject {
    public enum DirType {
        case cache
        case document
    }

    var rootUrl: URL
    
    public init(path: String, type: DirType) {
        var root: String?
        switch type {
        case .cache:
            root = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        case .document:
            root = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        }
        assert(root != nil, "NSSearchPathForDirectoriesInDomains failed!")
        let suffix = path.isEmpty ? "com.tm.public" : path
        self.rootUrl = URL(fileURLWithPath: root!).appendingPathComponent("com.tm.storage").appendingPathComponent(suffix)
    }
    
    @discardableResult
    open func store(value: Any, forKey key: String, andPath path: String) -> Bool {
        let dirUrl = rootUrl.appendingPathComponent(path)
        var created = true
        do {
            try FileManager.default.createDirectory(at: dirUrl, withIntermediateDirectories: true, attributes: nil)
        } catch {
            created = false
        }
        assert(created, "create directory error!")
        let filePath = dirUrl.appendingPathComponent(key).absoluteString
        var dataValue: Data
        if let data = value as? Data {
            dataValue = data
        } else {
            dataValue = NSKeyedArchiver.archivedData(withRootObject: value)
        }
        return FileManager.default.createFile(atPath: filePath, contents: dataValue, attributes: nil)
    }
    
    open func restoreData(forKey key: String, andPath path: String) -> Data? {
        let filePath = rootUrl.appendingPathComponent(path).appendingPathComponent(key).absoluteString
        if FileManager.default.fileExists(atPath: filePath),
            let data = try? Data.init(contentsOf: URL(fileURLWithPath: filePath)) {
            return data
        }
        return nil
    }
    
    open func restoreObject(forKey key: String, andPath path: String) -> Any? {
        guard let data = restoreData(forKey: key, andPath: path) else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: data)
    }
    
    @discardableResult
    open func remove(forKey key: String, andPath path: String) -> Bool {
        let filePath = rootUrl.appendingPathComponent(path).appendingPathComponent(key).absoluteString
        var rst = true
        do {
            try FileManager.default.removeItem(atPath: filePath)
        } catch {
            rst = false
        }
        return rst
    }
}

@objc(StorageEntity)
open class StorageEntity: NSObject {
    @objc open var object: Any
    @objc open var key: String
    @objc open var path: String
    @objc open var date: Date
    
    @objc public init(object: Any, key: String, path: String) {
        self.object = object
        self.key = key
        self.path = path
        date = Date()
    }
}

@objc(StorageManager)
open class StorageManager: BaseStorageManager {
    
    public typealias Completion = (StorageEntity) -> Void
    private let queue: DispatchQueue
    
    public override init(path: String, type: DirType) {
        queue = DispatchQueue(label: "com.couple.storage.queue", attributes: .concurrent)
        super.init(path: path, type: type)
    }
    
    open func store(value: Any, forKey key: String, andPath path: String, completion: Completion?) {
        queue.async(flags: .barrier) {
            self.store(value: value, forKey: key, andPath: path)
            let entity = StorageEntity(object: value, key: key, path: path)
            completion?(entity)
        }
    }
    
    open func store(values: [Any], forKeys keys: [String], andPaths path: String, completion: (() -> Void)?) {
        assert(values.count == keys.count, "values count must equal to keys count")
        queue.async(flags: .barrier) {
            values.enumerated().forEach({ (index, value) in
                self.store(value: value, forKey: keys[index], andPath: path)
            })
            completion?()
        }
    }
    
    open func data(forKey key: String, andPath path: String, completion: Completion?) {
        queue.async {
            guard let data = self.restoreData(forKey: key, andPath: path) else { return }
            let entity = StorageEntity(object: data, key: key, path: path)
            entity.date = self.lastModifyDate(forKey: key, path: path) ?? Date()
            completion?(entity)
        }
    }
    
    open func object(forKey key: String, andPath path: String, completion: Completion?) {
        queue.async {
            guard let data = self.restoreObject(forKey: key, andPath: path) else { return }
            let entity = StorageEntity(object: data, key: key, path: path)
            entity.date = self.lastModifyDate(forKey: key, path: path) ?? Date()
            completion?(entity)
        }
    }
    
    open func objects(forKeys keys: [String], andPath path: String, completion: (([Any]) -> Void)?) {
        queue.async {
            var array = [Any]()
            keys.forEach({ (key) in
                guard let object = self.restoreObject(forKey: key, andPath: path) else { return }
                array.append(object)
            })
            completion?(array)
        }
    }
    
    open func remove(forKeys keys: [String], andPath path: String, completion: (() -> Void)?) {
        queue.async(flags: .barrier) {
            keys.forEach({ (key) in
                self.remove(forKey: key, andPath: path)
            })
            completion?()
        }
    }
    
    open func lastModifyDate(forKey key: String, path: String) -> Date? {
        let filePath = rootUrl.appendingPathComponent(path).appendingPathComponent(key).absoluteString
        let attributes = try? FileManager.default.attributesOfItem(atPath: filePath)
        return attributes?[FileAttributeKey.modificationDate] as? Date
    }
}
