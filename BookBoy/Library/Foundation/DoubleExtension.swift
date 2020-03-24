//
//  DoubleExtension.swift
//  
//
//  Created by 飞流 on 2018/5/22.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation
import UIKit

extension TimeInterval {
    public static var secondsPerDay: TimeInterval {
        return 60 * 60 * 24
    }
}

extension Double {
    public func isDecimal() -> Bool {
        return abs(self) > 0 && abs(self) < 1
    }
}
