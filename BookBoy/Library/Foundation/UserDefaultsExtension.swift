//
//  UserDefaultsExtension.swift
//  
//
//  Created by 飞流 on 2018/5/23.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults {
    public class func set(_ value: Any?, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    public class func object(forKey key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    public class func removeObject(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}

extension UserDefaults {
    
    public class func executeOnceEveryVersion(withKey key: String, execute: () -> Void) {
        let versionKey = key + "_" + (Environment.shared.info.ver ?? "")
        if UserDefaults.standard.object(forKey: versionKey) == nil {
            UserDefaults.standard.set(versionKey, forKey: versionKey)
            execute()
        }
    }
    
    @discardableResult
    public class func executeOnce(withKey key: String, execute: () -> Void) -> Bool {
        if UserDefaults.standard.object(forKey: key) == nil {
            UserDefaults.standard.set(key, forKey: key)
            execute()
            return true
        } else {
            return false
        }
    }
    
    public class func executePeriodic(withKey key: String, shortestIntervals: TimeInterval, execute: () -> Void) {
        let preTimeInterval = UserDefaults.standard.double(forKey: key)
        let nowTimeInterval = Date().timeIntervalSince1970
        if preTimeInterval + shortestIntervals <= nowTimeInterval {
            UserDefaults.standard.set(nowTimeInterval, forKey: key)
            execute()
        }
    }
    /// 第X次执行某操作
    @objc public class func executeTimes(_ times: Int, withKey key: String, execute: () -> Void) {
        let t = UserDefaults.standard.integer(forKey: key) + 1
        if t == times {
            execute()
        }
        UserDefaults.standard.set(t, forKey: key)
    }
    /// 每X次执行某操作
    public class func executeEveryTimes(_ times: Int, withKey key: String, execute: () -> Void) {
        let t = UserDefaults.standard.integer(forKey: key) + 1
        if t % times == 0 {
            execute()
        }
        UserDefaults.standard.set(t, forKey: key)
    }
    public class func willExecuteWhen(_ when: (Int) -> Bool, withKey key: String, execute: () -> Void) {
        let t = UserDefaults.standard.integer(forKey: key) + 1
        if when(t) {
            execute()
        }
        UserDefaults.standard.set(t, forKey: key)
    }
    /// 闭包第一个参数是启动次数，第二个参数是当前版本的启动次数
    public class func executeLaunchTimes(withKey key: String, action: (Int, Int) -> Void) {
        let cvkey = key + AppVersion.version
        let lt = UserDefaults.standard.integer(forKey: key) + 1
        let cvlt = UserDefaults.standard.integer(forKey: cvkey) + 1
        action(lt, cvlt)
        UserDefaults.standard.set(lt, forKey: key)
        UserDefaults.standard.set(cvlt, forKey: cvkey)
    }
}
