//
//  Global.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/25.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

struct Global {
    static func currentTimestamp() -> String {
        let interval = Date().timeIntervalSince1970
        return String(format: ".f", interval)
    }
    
    static func randomString(_ len: Int = 8) -> String {
        let random_str_characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var ranStr = ""
            for _ in 0..<len {
                let index = Int(arc4random_uniform(UInt32(random_str_characters.count)))
                ranStr.append(random_str_characters[random_str_characters.index(random_str_characters.startIndex, offsetBy: index)])
            }
        return ranStr
    }
}

extension NSObject {
    @discardableResult
    static func exchangeMethod(targetSel: Selector, newSel: Selector) -> Bool {
         guard let before: Method = class_getInstanceMethod(self, targetSel),
             let after: Method = class_getInstanceMethod(self, newSel) else {
                 return false
         }
         method_exchangeImplementations(before, after)
         return true
     }
}
