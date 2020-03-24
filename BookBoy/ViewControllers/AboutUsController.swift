//
//  AboutUsController.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/24.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit
import MessageUI

class AboutUsController: ViewController {


    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var ivLogo: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelVersion: UILabel!
    
    @IBOutlet weak var labelContact: UILabel!
    @IBOutlet weak var labelPrivacy: UILabel!
    @IBOutlet weak var labelPowered: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("About Us", comment: "")
        baseView.layer.cornerRadius = 20;
        baseView.layer.shadowColor = UIColor(hex: 0x000000, alpha: 0.2).cgColor
        baseView.layer.shadowOffset = CGSize(width: 0, height: 5)
        baseView.layer.shadowOpacity = 1
        baseView.layer.shadowRadius = 20
        
        ivLogo.layer.cornerRadius = 20
        ivLogo.clipsToBounds = true
        
        if let logo = UIKitBundle.logo {
            ivLogo.image = logo
        }else {
            ivLogo.image = UIImage(named: "logo_default")
        }
        
        
        labelContact.text = NSLocalizedString("Contact Us", comment: "")
        labelPrivacy.text = NSLocalizedString("Privacy Policy", comment: "")
        
        labelName.text = Environment.shared.config.name
        labelVersion.text = "\(Environment.shared.info.ver ?? "1.0.0")"
        labelPowered.text = NSLocalizedString("Powered by Three Thousand Soliders", comment: "")
    }
    
    @IBAction func contactUsAction(_ sender: Any) {
        let actionBusiness = UIAlertAction(title: NSLocalizedString("Business Cooperation", comment: ""), style: UIAlertAction.Style.default) { _ in
            self.sendEmail("upontm@gmail.com")
        }
        let actionFeedback = UIAlertAction(title: NSLocalizedString("Problem Feedback", comment: ""), style: .default) { _ in
            self.sendEmail("upontm@163.com")
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let alert = UIAlertController(title: nil, message: NSLocalizedString("Your opinion has always been an important reference for us to optimize our products. We are looking forward to your letter.", comment: ""), preferredStyle: .actionSheet)
        alert.addAction(actionBusiness)
        alert.addAction(actionFeedback)
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func privacyAction(_ sender: Any) {
        let webview = WebViewController(url: Urls.privacyPolicy)
        let nav = NavigationController(rootViewController: webview)
        self.present(nav, animated: true, completion: nil)
    }
}

extension AboutUsController: MFMailComposeViewControllerDelegate {
    func sendEmail(_ email: String) {
        //0.首先判断设备是否能发送邮件
        if MFMailComposeViewController.canSendMail() {
            //1.配置邮件窗口
            let mailView = configuredMailComposeViewController(email)
            //2. 显示邮件窗口
            present(mailView, animated: true, completion: nil)
        } else {
            print("Whoop...设备不能发送邮件")
            showSendMailErrorAlert()
        }
    }

    //MARK:- helper methods
    //配置邮件窗口
    func configuredMailComposeViewController(_ email: String) -> MFMailComposeViewController {

        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        //设置邮件地址、主题及正文
        mailComposeVC.setToRecipients([email])
        mailComposeVC.setSubject("《\(Environment.shared.config.name)》")
        mailComposeVC.setMessageBody(NSLocalizedString("Mail text", comment: ""), isHTML: false)
        return mailComposeVC
    }


    //提示框，提示用户设置邮箱
    func showSendMailErrorAlert() {

        let sendMailErrorAlert = UIAlertController(title: NSLocalizedString("Mail not enabled", comment: ""), message: NSLocalizedString("The device mail function has not been turned on. Please change it in settings", comment: ""), preferredStyle: .alert)
        sendMailErrorAlert.addAction(UIAlertAction(title: NSLocalizedString("Confirm", comment: ""), style: .default) { _ in })
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }


    //MARK:- Mail Delegate
    //用户退出邮件窗口时被调用
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue{
        case MFMailComposeResult.sent.rawValue:
            print("邮件已发送")
        case MFMailComposeResult.cancelled.rawValue:
            print("邮件已取消")
        case MFMailComposeResult.saved.rawValue:
            print("邮件已保存")
        case MFMailComposeResult.failed.rawValue:
            print("邮件发送失败")
        default:
            print("邮件没有发送")
            break
        }

        controller.dismiss(animated: true, completion: nil)
    }
}
