//
//  Environment.swift
//  webapp
//
//  Created by wangyang on 2017/3/8.
//  Copyright © 2017年 qufaya. All rights reserved.
//


import SwiftyJSON
import AdSupport
import CryptoSwift

struct AppInfo {
    var appid: String?
    var packagename: String?
    var ver: String?
    var os: String?
    var ch: String?
    var dm: String?
    var idfa: String?
    var deviceid: String?
    var devicename: String?
    
    var credential: String {
        return "appid=\(appid!)&pkg=\(packagename!)&ver=\(ver!)&ch=\(ch!)".bytes.toBase64() ?? ""
    }
    
    func toDic() -> [String: Any] {
        var dic = [String: Any]()
        dic["appid"] = appid
        dic["packagename"] = packagename
        dic["ver"] = ver
        dic["os"] = os
        dic["ch"] = ch
        dic["dm"] = dm
        dic["idfa"] = idfa
        dic["deviceid"] = deviceid
        dic["devicename"] = devicename
        return dic
    }
    
}

struct AppConfig {
    var id: String
    var name: String
    var url: String
    var umengkey: String
    var needNav: Bool
    var navColor: String?
    var title: String?
    var appId: String
    var yfqSuffix: String
    
    init() {
        id = "0"
        name = ""
        url = "http://www.uponup.cn"
        umengkey = ""
        needNav = true
        title = ""
        appId = ""
        yfqSuffix = ""
    }
    
    init(dic: [String: Any]) {
        let json = JSON(dic)
        id = json["id"].stringValue
        name = json["name"].stringValue
        url = json["url"].stringValue
        umengkey = json["umengkey"].stringValue
        needNav = json["needNav"].bool ?? true
        navColor = json["navColor"].string
        title = json["title"].string
        appId = json["appId"].stringValue
        yfqSuffix = json["yfqSuffix"].stringValue
    }
}

enum Configuration {
    case release, debug
    
    var channel: String {
        switch self {
        case .release:
            return "AppStore"
        case .debug:
            return "InHouse"
        }
    }
    
    static var current: Configuration {
        #if DEBUG
        return .debug
        #else
        return .release
        #endif
    }
    
}

func doOnDebug(_ action: () -> Void) {
    if Configuration.current == .debug {
        action()
    }
}

class Environment {
    
    static let shared = Environment()
    var info: AppInfo = AppInfo()
    var config: AppConfig
    var pushToken: String?
    
    init() {
        let targetName = (Bundle.main.infoDictionary?["TargetName"] as? String) ?? ""
        if let path = Bundle.main.path(forResource: targetName, ofType: "plist"), let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
            config = AppConfig(dic: dic)
        } else {
            config = AppConfig()
        }
        info.appid = config.id
        info.packagename = config.name
        info.os = UIDevice.current.systemVersion + UIDevice.current.systemName
        info.ver = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "1.0.0"
        info.ch = "AppStore"
        info.dm = UIDevice.deviceModelReadable()
        info.idfa = Environment.idfa
        info.deviceid = Environment.deviceid
        info.devicename = UIDevice.deviceName()
    }
}

extension Environment {
    static var deviceid: String {
        let key = "com.tm.deviceid"
        if let uuid = UserDefaults.standard.string(forKey: key) {
            return uuid
        }
        if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            return ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
        let uuid = UUID().uuidString
        UserDefaults.standard.set(uuid, forKey: key)
        return uuid
    }
    
    static var idfa: String? {
        if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            return ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
        return nil
    }
    
    static let appId = "1444722486"
}

extension String {
    var fullKey: String {
        return "com.webapp." + Environment.shared.config.name + self
    }
}
