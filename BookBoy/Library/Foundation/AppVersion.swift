//
//  AppInfo.swift
//  
//
//  Created by 飞流 on 2018/5/24.
//  Copyright © 2018年 couple. All rights reserved.
//

import UIKit

struct AppVersion {
    
    public static var version: String {
        return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
        
    public static var versionChanged: Bool {
        let key = "KLastVersion"
        let currentVersion = AppVersion.version
        let version = UserDefaults.standard.string(forKey: key)
        if version == nil {
            UserDefaults.standard.set(currentVersion, forKey: key)
            return false
        }
        if version! == currentVersion {
            return false
        }
        UserDefaults.standard.set(currentVersion, forKey: key)
        return true
    }
}
