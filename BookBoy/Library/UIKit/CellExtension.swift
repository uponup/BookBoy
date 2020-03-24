//
//  CellExtension.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/21.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

extension UITableViewCell {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    public func registerCellClass(_ cellClass: UITableViewCell.Type) {
        let identifier = cellClass.identifier
        if Bundle.main.path(forResource: identifier, ofType: "nib") != nil {
            register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }else {
            register(cellClass, forCellReuseIdentifier: identifier)
        }
    }
}


extension UICollectionViewCell {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    public func registerCellClass(_ cellClass: UICollectionViewCell.Type) {
        let identifier = cellClass.identifier
        if Bundle.main.path(forResource: identifier, ofType: "nib") != nil {
            register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        }else {
            register(cellClass, forCellWithReuseIdentifier: identifier)
        }
    }
}


