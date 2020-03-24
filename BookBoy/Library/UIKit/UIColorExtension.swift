//
//  UIColorExtension.swift

//
//  Created by wangyang on 2017/8/24.
//  Copyright © 2017年 couple. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    @objc public convenience init(hex hexValue: Int, alpha: CGFloat = 1) {
        let red = (CGFloat((hexValue & 0xFF0000) >> 16)) / 255
        let green = (CGFloat((hexValue & 0xFF00) >> 8)) / 255
        let blue = (CGFloat(hexValue & 0xFF)) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    @objc public convenience init(hexString str: String, alpha: CGFloat = 1) {
        var hex = str
        if str.hasPrefix("0x") {            
            hex = String(str[str.index(str.startIndex, offsetBy: 2)...])
        }
        self.init(hex: Int(hex, radix: 16) ?? 0)
    }
}

extension UIColor {
    
    class var normalSeparateLine: UIColor {
        return UIColor(hex: 0xe5e6e7)
    }
    
    public class var random: UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256))/256.0, green: CGFloat(arc4random_uniform(256))/256.0, blue: CGFloat(arc4random_uniform(256))/256.0, alpha: 1)
    }
    
    class var tmBlue: UIColor {
        return UIColor(hex: 0x1296db)
    }
    
    class var tmGreen: UIColor {
        return UIColor(hex: 0x41c6ad)
    }
    
    class var tmGray: UIColor {
        return UIColor(hex: 0x959595)
    }
}
