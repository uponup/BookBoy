//
//  NibCreatable.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/29.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation

public protocol NibCreatable: class {
    static func createFromNib(owner: Any?) -> Self?
}

extension NibCreatable where Self: Any {
    
    public static func createFromNib(owner: Any? = nil) -> Self? {
        let bundle = Bundle(for: Self.self)
        let contents = bundle.loadNibNamed(nibName, owner: owner, options: nil)
        guard let result = contents?.last as? Self else {
            return nil
        }
        return result
    }
    
    public static var nibName: String {
        return String(describing: Self.self)
    }
}
