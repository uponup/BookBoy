//
//  WebViewController.swift
//  QufayaUIKit
//
//  Created by wangyang on 2017/10/25.
//  Copyright © 2017年 qufaya. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import SnapKit

open class WebViewController: UIViewController {
    
    public var webView: WKWebView!
    public var progressView: WKProgressView!
    public var activity: UIActivityIndicatorView?
    public var url: URL
    public var canClose = true
    
    public init(url: URL) { //for oc
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    public init(url: URL, canClose: Bool) {
        self.url = url
        self.canClose = canClose
        super.init(nibName: nil, bundle: nil)
    }
    
    public init?(urlString: String) {
        if let url = URL(string: urlString) {
            self.url = url
        } else {
            return nil
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        webView?.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        if canClose {
            let backBarItem = UIBarButtonItem(image: UIImage(named: "navigationbar_arrow_back"), style: .plain, target: self, action: #selector(self.goBack))
            let closeBarItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(self.close))
            navigationItem.leftBarButtonItems = [backBarItem, closeBarItem]
        }
        progressView = WKProgressView(frame: CGRect(x: 0, y: 43, width: UIScreen.width, height: 1))
        
        HTTPCookieStorage.shared.cookieAcceptPolicy = .always
        
        let config = WKWebViewConfiguration()
        if #available(iOS 10.0, *) {
            config.dataDetectorTypes = .all
        }
        config.allowsInlineMediaPlayback = true
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        
        webView = WKWebView(frame: view.bounds, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        if #available(iOS 9.0, *) {
            webView.allowsLinkPreview = true
        }
        webView.backgroundColor = UIColor(hex: 0xf8f8f8)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.scrollView.disableAdjustInset()
        view.addSubview(webView)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        webView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.edges.equalToSuperview()
            }
        }
        let activity = UIActivityIndicatorView(style: .gray)
        self.activity = activity
        activity.startAnimating()
        view.addSubview(activity)
        activity.snp.makeConstraints {
            if #available(iOS 11.0, *) {
                $0.center.equalTo(view.safeAreaLayoutGuide)
            } else {
                $0.center.equalToSuperview()
            }
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.addSubview(progressView)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        progressView.removeFromSuperview()
    }
    
    @objc open func goBack() {
        if webView.canGoBack {
            webView.goBack()
        } else {
            close()
        }
    }
    
    @objc open func close() {
        if let count = navigationController?.viewControllers.count , count > 1 {
            _ = navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress", let newValue: Double = change?[.newKey] as? Double {
            progressView.setProgress(Float(newValue), animated: true)
        }
    }
}

extension WebViewController: WKNavigationDelegate {
    
    open func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        progressView.start()
    }
    
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.finish()
        activity?.removeFromSuperview()
        webView.evaluateJavaScript("document.title") { [weak self] (result, _) in
            self?.title = result as? String
        }
    }
    
    open func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        progressView.finish()
        activity?.removeFromSuperview()
    }
    
    @available(iOS 9.0, *)
    open func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
}

extension WebViewController: WKUIDelegate {
    //target="_blank"
    open func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        webView.load(navigationAction.request)
        return nil
    }
    
    //UI Panels
    open func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "确认", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        completionHandler()
    }
    
    open func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "取消", style: .cancel) { (action) in
            completionHandler(false)
            alert.dismiss(animated: true, completion: nil)
        }
        let actionOK = UIAlertAction(title: "确认", style: .default) { (action) in
            completionHandler(true)
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(actionCancel)
        alert.addAction(actionOK)
        present(alert, animated: true, completion: nil)
    }
    
    open func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alert = UIAlertController(title: prompt, message: nil, preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "请输入" }
        let action = UIAlertAction(title: "确认", style: .default) { (action) in
            completionHandler(alert.textFields?.first!.text)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

public class WKProgressView: UIView {
    
    private var progressView: UIView
    public var progressColor: UIColor? {
        get {
            return progressView.backgroundColor
        }
        set {
            progressView.backgroundColor = newValue
        }
    }
    
    public override init(frame: CGRect) {
        progressView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: frame.height))
        super.init(frame: frame)
        progressView.backgroundColor = UIColor(hex: 0xFDB03B)
        backgroundColor = UIColor.clear
        addSubview(progressView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setProgress(_ progress: Float, animated: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.progressView.frame.size.width = self.width * CGFloat(progress)
        }
    }
    
    public func start() {
        progressView.isHidden = false
    }
    
    public func finish() {
        progressView.isHidden = true
    }
    
}

