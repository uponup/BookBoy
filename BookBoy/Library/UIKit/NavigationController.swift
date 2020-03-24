//
//  NavigationController.swift

//
//  Created by 天明 on 2018/5/23.
//  Copyright © 2018年 couple. All rights reserved.
//

import UIKit

@objc(NavigationController)
open class NavigationController: UINavigationController, UINavigationControllerDelegate {
    
    @objc public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        commonInit()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: 0x434343)]
        self.delegate = self
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.tmBlue
        self.navigationBar.shadowImage = UIImage()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.delegate = nil
        }
    }
    
    open override var shouldAutorotate: Bool {
        return false
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            let enable = navigationController.viewControllers.count > 1 && (navigationController.topViewController?.interactivePopGestureRecognizerEnable() ?? false)
            self.interactivePopGestureRecognizer?.isEnabled = enable
        }
    }
}

extension UIViewController {
    
    @objc public func defaultNavigationController() -> UINavigationController {
        if self.isKind(of: UINavigationController.classForCoder()) {
            return self as! UINavigationController
        } else if let navigationVC = self.navigationController {
            return navigationVC
        }
        return NavigationController(rootViewController: self)
    }
    
    @objc open func interactivePopGestureRecognizerEnable() -> Bool {
        return true
    }
}
