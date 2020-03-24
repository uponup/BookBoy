//
//  ViewController.swift

//  Created by wangyang on 16/5/19.
//  Copyright © 2016年 All rights reserved.
//

import UIKit

open class ViewController: UIViewController {
    private weak var _navigationController: UINavigationController?
    public static var backImage: UIImage? = UIKitBundle.arrowBackImage

    open override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor(hex: 0xf7f7f7)
        _navigationController = navigationController
        if (!showNavigationbar()) {
            _navigationController?.setNavigationBarHidden(true, animated: true)
        }
        guard let nav = navigationController else { return }
        if (nav.viewControllers.count > 1 || nav.presentingViewController != nil) && navigationItem.leftBarButtonItem == nil &&
            (navigationItem.leftBarButtonItems == nil || navigationItem.leftBarButtonItems!.count == 0) {
            let image = ViewController.backImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            let button = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action: #selector(popWithAnimation))
            navigationItem.leftBarButtonItem = button
        }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        if (!showNavigationbar()) {
            if (_navigationController?.topViewController as? ViewController)?.showNavigationbar() ?? true {
                _navigationController?.setNavigationBarHidden(false, animated: true)
            }
        }
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (!showNavigationbar()) {
            _navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let classString = String(describing: type(of: self))
        if Bundle.main.path(forResource: classString, ofType: "nib") == nil {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        } else {
            super.init(nibName: nibNameOrNil ?? classString, bundle: nibBundleOrNil)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open func showNavigationbar() -> Bool {
        return true
    }
    
    @objc open func popWithAnimation() {
        if let nav = self.navigationController, nav.viewControllers.count > 1 {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
