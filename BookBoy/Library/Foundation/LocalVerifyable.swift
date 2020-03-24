//
//  FingerUnlockAble.swift

//  Created by 飞流 on 16/8/17.
//  Copyright © 2016年 All rights reserved.
//

import UIKit
import LocalAuthentication

public protocol LocalVerifyable {
    var verifySuccessBlock: (() -> Void)? { get set }
    func doVerify(cancel: (() -> Void)?);
}

extension LocalVerifyable where Self: UIViewController {
    public func doVerify(cancel: (() -> Void)?) {
        let context = LAContext()
        var error: NSError?
        let reasonStr = "通过Home键验证指纹"
        context.localizedFallbackTitle = "账号登录"
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonStr, reply: { [weak self] (success, error) -> Void in
                DispatchQueue.main.async {
                    if success {
                        self?.verifySuccessBlock?()
                        return
                    }
                    guard let error = error as NSError? else { return }
                    if #available(iOS 9.0, *),
                        error.code == LAError.Code.touchIDLockout.rawValue {
                        self?.unlockTouchID()
                        return
                    }
                    guard NSInteger(error.code) == LAError.Code.userFallback.rawValue else { return }
                    cancel?()
                }
            })
        } else {
            guard let error = error,
                #available(iOS 9.0, *),
                error.code == LAError.Code.touchIDLockout.rawValue
            else { return }
            unlockTouchID()
        }
    }
    
    private func unlockTouchID() {
        let context = LAContext();
        var authError: NSError? = nil;
        guard #available(iOS 9.0, *), context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) else { return }
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "需要您的密码，才能启用 Touch ID", reply: { [weak self] (success, evaluateError) in
            DispatchQueue.main.async {
                guard success else { return }
                self?.verifySuccessBlock?()
            }
        })
    }
}



