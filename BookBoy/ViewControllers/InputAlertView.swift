//
//  InputAlertView.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/22.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit
import FXBlurView

class InputAlertView: UIView, NibCreatable {
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var labelTips: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    
    private var contentView: UIView!
    private var strong: InputAlertView? = nil

    typealias CompletionBlock = ((Bool, String) -> Void)
    var completion: CompletionBlock? = nil
    
    override func awakeFromNib() {
        btnConfirm.setTitleColor(UIColor.black, for: .normal)
        btnConfirm.setTitleColor(UIColor.tmGray, for: .disabled)
        btnConfirm.isEnabled = false
        btnConfirm.setTitle(NSLocalizedString("Confirm", comment: ""), for: .normal)
        btnCancel.setTitle(NSLocalizedString("Cancel", comment: ""), for: .normal)
        labelTitle.text = NSLocalizedString("Add a book", comment: "")
        tf.placeholder = NSLocalizedString("Please enter a book name", comment: "")
        labelTips.text = NSLocalizedString("Support for numbers, English and Emoji", comment: "")
        labelCount.text = "\(0)/20"
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveKeyboardChanged(_:)), name: .keyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveKeyboardChanged(_:)), name: .keyboardWillHide, object: nil)
    }
    
    public func showWithBlock(block: @escaping CompletionBlock) {
        guard let window = UIApplication.shared.windows.last else { return }
        completion = block
        strong = self
        contentView = UIView(frame: window.bounds)
        contentView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.2)
        contentView.addTapAction(#selector(overlayTaped(tap:)), target: self)
        window.addSubview(contentView)
        contentView.addSubview(self)
        self.frame = CGRect(x: 0, y: UIScreen.height-UIScreen.topEdge-64-UIScreen.bottomEdge, width: UIScreen.width, height: 136)
        
        if tf.canBecomeFirstResponder {
            tf.becomeFirstResponder()
            print("注册成功")
        }
    }
    
    //MARK:- 通知 -
    @objc func didReceiveKeyboardChanged(_ notification: Notification) {
        print("收到通知:\n \(notification)")
        guard let userInfo = notification.userInfo, let rect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
        self.frame = CGRect(x: 0, y: rect.origin.y-(116+20), width: UIScreen.width, height: 116+20)
    }
    
    //MARK:- 响应 -
    @objc func overlayTaped(tap: UITapGestureRecognizer) {
        let point = tap.location(in: contentView)
        if !self.frame.contains(point) {
            self.dismiss()
        }
    }
    
    @IBAction func tfEditingChanged(_ sender: Any) {
        guard let text = tf.text else {
            btnConfirm.isEnabled = false
            return
        }
        if text.count > 0 && text.count <= 20 {
            btnConfirm.isEnabled = true
            labelCount.text = "\(text.count)/20"
        } else {
            guard text.count == 0 else {
                let subText = (text as NSString).substring(with: NSMakeRange(0, 20))
                tf.text = subText
                btnConfirm.isEnabled = true
                return
            }
            btnConfirm.isEnabled = false
        }
    }
    @IBAction func btnCancelAction(_ sender: Any) {
        if let block = completion {
            block(false, tf.text ?? "")
            dismiss()
        }
    }
    
    @IBAction func btnConfirmAction(_ sender: Any) {
        if let block = completion {
            block(true, tf.text ?? "")
            dismiss()
        }
    }
    
    private func dismiss() {
        strong = nil
        self.resignFirstResponder()
        self.removeFromSuperview()
        contentView.removeFromSuperview()
    }
    
    deinit {
        print("unregister")
        NotificationCenter.default.removeObserver(self)
    }
}
