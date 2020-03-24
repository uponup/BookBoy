//
//  UIKitBundle.swift

//
//  Created by wangyang on 2017/10/16.
//  Copyright © 2017年 couple. All rights reserved.
//

import UIKit

class UIKitBundle {
    
    static var arrowRightImage: UIImage? { return self.image(named: "cell_arrow_right") }
    static var arrowSelectedImage: UIImage? { return self.image(named: "cell_arrow_selected") }
    static var arrowBackImage: UIImage? { return self.image(named: "nav_icon_back") }
    static var imagePickerChecked: UIImage? {
        return self.image(named: "icon_imagepicker_checked")
    }
    static var imagePickerUnchecked: UIImage? {
        return self.image(named: "icon_imagepicker_unchecked")
    }
    
    static var logo: UIImage? {
        guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? NSDictionary,
            let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? NSDictionary,
            let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? NSArray,            let lastIcon = iconFiles.lastObject as? String,
            let icon = UIImage(named: lastIcon) else {
                return nil
        }
        return icon
    }
    
    static func bundle() -> Bundle? {
        return Bundle(for: self)
    }
    
    static func image(named name: String) -> UIImage? {
        return UIImage(named: name, in: UIKitBundle.bundle(), compatibleWith: nil)
    }
}

