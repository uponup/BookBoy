//
//  UITableViewExtension.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/21.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit
import SnapKit

protocol EmptyProtocol {
    var isEmpty: Bool {get}
    func configEmptyView(tableView: UITableView) -> UIView
}

private var kEmptyViewDelegate = ""
private let emptyViewTag: Int = 350132706

extension UITableView {
    func setEmptyViewDelegate(target: EmptyProtocol) {
        self.emptyDelegate = target
        DispatchQueue.once(token: "emptyTableView") {
            UITableView.exchangeMethod(targetSel: #selector(layoutSubviews), newSel: #selector(re_layoutSubviews))
        }
    }
    
    @objc func re_layoutSubviews() {
        self.re_layoutSubviews()
        
        self.viewWithTag(emptyViewTag)?.removeFromSuperview()
        
        if let delegate = self.emptyDelegate {
            if delegate.isEmpty {
                let emptyView = delegate.configEmptyView(tableView: self)
                emptyView.tag = emptyViewTag
                self.addSubview(emptyView)
            }
        }
        
    }
    
    private var emptyDelegate: EmptyProtocol? {
        get {
            return (objc_getAssociatedObject(self, &kEmptyViewDelegate) as? EmptyProtocol)
        }
        set (newValue){
            objc_setAssociatedObject(self, &kEmptyViewDelegate, newValue!, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}

