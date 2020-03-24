//
//  OCRTarget.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/28.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation
import Moya

enum OCRTarget {
    case general(String)
}

extension OCRTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.ai.qq.com")!
    }
    
    var path: String {
        switch self {
        case .general:
            return "/fcgi-bin/ocr/ocr_generalocr"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Moya.Task {
        switch self {
        case .general(let imgEncode):
            var params: [String: Any] = [:]
            params["app_id"] = ""
            params["time_stamp"] = Global.currentTimestamp()
            params["nonce_str"] = Global.randomString()
            params["image"] = imgEncode
            params["sign"] = getSign(params)
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    // 单元测试使用
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
}


extension TargetType {
    func getSign(_ param: [String: Any]) -> String {
        let salt = "app_key=\(Keys.tecentAiAppKey)"
        let keyValues = param.keys.sorted(by: <)
            .map{ "\($0)=\(param[$0]!)" }
            .joined(separator: "&")
        return "\(keyValues)&\(salt)".md5().uppercased()
    }
}
