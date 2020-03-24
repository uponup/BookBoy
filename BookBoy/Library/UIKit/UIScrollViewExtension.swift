//
//  UIScrollViewExtension.swift

//
//  Created by wangyang on 2017/8/29.
//  Copyright © 2017年 couple. All rights reserved.
//

import UIKit

extension UIScrollView {
    @objc public func scrollToBottom() {
        contentOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
    }
    
    @objc public func disableAdjustInset() {
        if #available(iOS 11.0, *) {
            contentInsetAdjustmentBehavior = .never
        }
    }

}
