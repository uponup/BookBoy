//
//  UICollectionViewExtension.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/24.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

protocol EmptyCollectionProtocol {
    var isEmpty: Bool { get }
    func configEmptyView(collectionView: UICollectionView) -> UIView
}

private var kEmptyCollectionDelegate = ""
private let emptyCollectionTag: Int = 350132707

extension UICollectionView {
    var emptyDelegate: EmptyCollectionProtocol? {
        get {
            return (objc_getAssociatedObject(self, &kEmptyCollectionDelegate) as? EmptyCollectionProtocol)
        }
        set {
            objc_setAssociatedObject(self, &kEmptyCollectionDelegate, newValue!, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func setEmptyDelegate(target: EmptyCollectionProtocol) {
        self.emptyDelegate = target
        DispatchQueue.once(token: "emptyCollection") {
            UICollectionView.exchangeMethod(targetSel: #selector(layoutSubviews), newSel: #selector(re_layoutSubviews))
        }
    }
    
    @objc func re_layoutSubviews() {
        self.re_layoutSubviews()
        
        self.viewWithTag(emptyCollectionTag)?.removeFromSuperview()
        
        if let delegate = self.emptyDelegate {
            if delegate.isEmpty {
                let emptyView = delegate.configEmptyView(collectionView: self)
                emptyView.tag = emptyCollectionTag
                self.addSubview(emptyView)
            }
        }
    }
}
