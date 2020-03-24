//
//  LocalReminder.swift
//  
//
//  Created by 飞流 on 2018/5/24.
//  Copyright © 2018年 couple. All rights reserved.
//

import UIKit
import StoreKit

@available(iOSApplicationExtension, unavailable)
@objc public class GoodCommentReminder: NSObject {
    
    private static let gradeLog = "kClientRateLog"
    private static let showGradeKey = "showRate"
    
    public enum GradeStatus: Int {
        case no, pushed, grading, graded
    }
    
    private static var appId: String = ""
    private static var alertMessage: String = "给个好评吧"
    private static var gradingDate: Date = Date()
    private static var myTask: UIBackgroundTaskIdentifier?
    private static var willShowLocalNotification = false
    private static var pushedForThisLaunch = false
    private static var launchTime = 0
    private static var currentVersionLaunchTime = 0
    private static var status: GradeStatus {
        set {
            var info = UserDefaults.standard.dictionary(forKey: gradeLog)
            info?[AppVersion.version] = newValue.rawValue
            UserDefaults.standard.set(info, forKey: gradeLog)
        }
        get {
            var info = UserDefaults.standard.dictionary(forKey: gradeLog)
            let rawValue = (info?[AppVersion.version] as? Int) ?? 0
            return GradeStatus(rawValue: rawValue) ?? .no
        }
    }
    
    @objc public class func setAppId(_ appId: String) {
        GoodCommentReminder.appId = appId
    }
    @objc public class func setAlertMessage(_ message: String) {
        GoodCommentReminder.alertMessage = message
    }
    
    public class func showGraded(with frequence: Int, by vc: UIViewController) {
        if !canShowGraded() { return }
        let frequence = max(2, frequence)
        UserDefaults.executeLaunchTimes(withKey: showGradeKey) {
            launchTime = $0
            currentVersionLaunchTime = $1
            willShowLocalNotification = false
            if currentVersionLaunchTime % frequence == frequence - 1 {
                pushedForThisLaunch = true
                showAlertGradeNotify(by: vc)
            }
        }
    }
    
    public class func showGradedIfNeed(by vc: UIViewController) {
        if !canShowGraded() { return }
        showAlertGradeNotify(by: vc)
    }
    
    public class func goGrade() {
        assert(appId.count > 0, "appID不能为空")
        gradingDate = Date()
        DispatchQueue.main.async {
            status = .grading
            var urlString = ""
            if #available(iOS 11.0, *) {
                urlString = "https://itunes.apple.com/cn/app/id\(appId)?mt=8"
            } else {
                urlString = "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(appId)&pageNumber=0&sortOrdering=1&type=Purple+Software"
            }
            if let url = URL(string: urlString) {
                UIApplication.shared.openURL(url)
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(backToApp), name: UIApplication.willEnterForegroundNotification, object: nil)
        myTask = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            
        })
        perform(#selector(gradeDone), with: nil, afterDelay: 30)
        
    }
    
    @objc public class func alreadyGraded() -> Bool {
        return status == .graded
    }
    
    private class func canShowGraded() -> Bool {
        assert(appId.count > 0, "appID不能为空")
        return !(willShowLocalNotification || pushedForThisLaunch || alreadyGraded())
    }
    
    class func showAlertGradeNotify(by vc: UIViewController) {
        if #available(iOS 11.0, *) {
            SKStoreReviewController.requestReview()
            status = .graded
            return
        }
        status = .pushed
        let alert = UIAlertController(title: alertMessage, message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "再看看", style: .cancel, handler: nil)
        let go = UIAlertAction(title: "去评分", style: .default) { (_) in
            goGrade()
        }
        alert.addAction(cancel)
        alert.addAction(go)
        vc.present(alert, animated: true, completion: nil)
    }
    
    @objc private class func backToApp() {
        status = .no
        if let task = myTask {
            UIApplication.shared.endBackgroundTask(task)
        }
        myTask = UIBackgroundTaskIdentifier.invalid
        NotificationCenter.default.removeObserver(self)
        cancelPreviousPerformRequests(withTarget: self, selector: #selector(gradeDone), object: nil)
    }
    
    @objc private class func gradeDone() {
        status = .graded
        myTask = UIBackgroundTaskIdentifier.invalid
        NotificationCenter.default.removeObserver(self)
    }
}

