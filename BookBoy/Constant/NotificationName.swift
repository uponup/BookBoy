//
//  NotificationName.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/25.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation
import UIKit

extension Notification.Name {
    static let didLogin = Notification.Name("didLogin")
    static let keyboardWillShow = UIApplication.keyboardWillShowNotification
    static let keyboardWillHide = UIApplication.keyboardWillHideNotification
}
