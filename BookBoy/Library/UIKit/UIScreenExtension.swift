//
//  UIScreenExtension.swift

//
//  Created by wangyang on 2017/8/22.
//  Copyright © 2017年 couple. All rights reserved.
//

import UIKit

extension UIScreen {
    public static let width = UIScreen.main.bounds.width
    public static let height = UIScreen.main.bounds.height
    public static let size = UIScreen.main.bounds.size
    @available(iOSApplicationExtension, unavailable)
    public static var topEdge: CGFloat {
        guard let window = UIApplication.shared.windows.first else { return 0}
        if #available(iOS 11.0, *) {
            let top = window.safeAreaInsets.top
            return top == 0 ? 20 : top
        } else {
            return 20
        }
    }
    @available(iOSApplicationExtension, unavailable)
    @objc public static var bottomEdge: CGFloat {
        guard let window = UIApplication.shared.windows.first else { return 0}
        if #available(iOS 11.0, *) {
            let bottom = window.safeAreaInsets.bottom
            return bottom == 0 ? 0 : bottom
        } else {
            return 0
        }
    }
    @available(iOSApplicationExtension, unavailable)
    public static var safeHeight: CGFloat {
        return UIScreen.height - UIScreen.topEdge - UIScreen.bottomEdge
    }
    
    public static var resolution: String {
        let size = UIScreen.main.bounds.size
        let scale = UIScreen.main.scale
        return String(format: "%.0f*%.0f", size.width * scale, size.height * scale)
    }
}
