//
//  Urls.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/25.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation
import UIKit

enum Urls {
    static let privacyPolicy = URL(string: "https://github.com/uponup/PrivacyPolicy/blob/master/bb.md")!
    static let systemSetting = URL(string: UIApplication.openSettingsURLString) ?? URL(string: "")!
    
    static let shareURL = "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(Environment.shared.config.appId)&pageNumber=0&sortOrdering=1&type=Purple+Software"
    static let rateURL: String = {
        let urlString: String
        if #available(iOS 11.0, *) {
            urlString = "https://itunes.apple.com/cn/app/id\(Environment.shared.config.appId)?mt=8"
        } else {
            urlString = shareURL
        }
        return urlString
    }()
}
