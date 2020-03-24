//
//  OptionalExtension.swift
//  
//
//  Created by 飞流 on 2018/5/23.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    public var isEmpty: Bool {
        switch self {
        case .none:
            return true
        case .some(let value):
            return value.isEmpty
        }
    }
}

public protocol _IntValue {
    var value: Int { get }
}
extension Int: _IntValue {
    public var value: Int {
        return self
    }
}

public protocol _FloatValue {
    var value: Float { get }
}
extension Float: _FloatValue {
    public var value: Float {
        return self
    }
}

public protocol _DoubleValue {
    var value: Double { get }
}
extension Double: _DoubleValue {
    public var value: Double {
        return self
    }
}

public protocol _StringValue {
    var value: String { get }
}
extension String: _StringValue {
    public var value: String {
        return self
    }
}

public protocol _DataValue {
    var value: Data { get }
}
extension Data: _DataValue {
    public var value: Data {
        return self
    }
}

extension Optional where Wrapped: _IntValue {
    public var intValue: Int {
        switch self {
        case .none: return 0
        case .some(let v): return v.value
        }
    }
}

extension Optional where Wrapped: _FloatValue {
    public var floatValue: Float {
        switch self {
        case .none: return 0
        case .some(let v): return v.value
        }
    }
}

extension Optional where Wrapped: _DoubleValue {
    public var doubleValue: Double {
        switch self {
        case .none: return 0
        case .some(let v): return v.value
        }
    }
}

extension Optional where Wrapped: _StringValue {
    public var stringValue: String {
        switch self {
        case .none: return ""
        case .some(let v): return v.value
        }
    }
}

extension Optional where Wrapped: _DataValue {
    public var dataValue: Data {
        switch self {
        case .none:
            return Data()
        case .some(let v):
            return v.value
        }
    }
}

extension Optional {
    @discardableResult
    public func doOnSome(_ action: (Wrapped) -> Void) -> Optional {
        if let value = self {
            action(value)
        }
        return self
    }
    
    @discardableResult
    public func doOnNil(_ action: () -> Void) -> Optional {
        if self == nil {
            action()
        }
        return self
    }
}


public func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

public func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}
#if !swift(>=3.3) || (swift(>=4.0) && !swift(>=4.1))
public func == <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l == r
    case (nil, nil):
        return true
    default:
        return false
    }
}
#endif
