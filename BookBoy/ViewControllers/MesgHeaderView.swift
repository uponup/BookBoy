//
//  MesgHeaderView.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/21.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit
import UserNotifications

class MesgHeaderView: UIView, NibCreatable {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    @IBOutlet weak var swAuth: UISwitch!
    @IBOutlet weak var ivRight: UIImageView!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveEnterForegroud), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        labelTitle.text = NSLocalizedString("通知授权", comment: "")
        self.addTapAction(#selector(tapAction), target: self)
        
        reloadData()
    }
    
    func reloadData() {
        guard let auth = UserDefaults.object(forKey: UserDefaultKeys.notificationPermission) as? Bool else {
            labelDetail.text = NSLocalizedString("允许授权，您可以及时收到我们的推送消息。一般情况下，我们是不会打扰您的。", comment: "")
            ivRight.isHidden = true
            return
        }
        if auth {
            self.isHidden = true
        }else {
            swAuth.isHidden = true
            ivRight.isHidden = false
            labelDetail.text = NSLocalizedString("获取授权失败，您可以「设置」->「\(Environment.shared.info.packagename ?? "本App")」中打开设置。一般情况下，我们是不会打扰您的。", comment: "")
        }
    }
    
    func registerNotification() {
        appDelegate.registerForRemoteNotification { (isCompletion) in
            UserDefaults.set(isCompletion, forKey: UserDefaultKeys.notificationPermission)
            Thread.doOnMain {
                self.isHidden = isCompletion
                self.reloadData()
            }
        }
    }
    
    @objc func tapAction() {
        guard !ivRight.isHidden else {
            return
        }
        // 打开设置界面
        if UIApplication.shared.canOpenURL(Urls.systemSetting) {
            UIApplication.shared.open(Urls.systemSetting, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func swAuthAction(_ sender: Any) {
        registerNotification()
    }
    
    @objc func didReceiveEnterForegroud() {
        registerNotification()
    }
        
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
