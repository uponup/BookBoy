//
//  BundleExtension.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/29.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation

extension Bundle {
    static func bundle(bundleName: String, target: AnyClass) -> Bundle {
        let bundle = Bundle(for: target)
        let tempPath = bundle.path(forResource: bundleName, ofType: "bundle")
        
        guard let path = tempPath else {
            return Bundle.main
        }
        return Bundle(path: path)!
    }
}
