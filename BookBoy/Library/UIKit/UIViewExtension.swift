//
//  UIViewExtension.swift

//
//  Created by wangyang on 2017/8/22.
//  Copyright © 2017年 couple. All rights reserved.
//

import UIKit

//MARK:- Geometry
extension UIView {
    
    @objc public var top: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame = CGRect(x: left, y: newValue, width: width, height: height)
        }
    }
    
    @objc public var bottom: CGFloat {
        get {
            return top + height
        }
        set {
            frame = CGRect(x: left, y: newValue - height, width: width, height: height)
        }
    }
    
    @objc public var left: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame = CGRect(x: newValue, y: top, width: width, height: height)
        }
    }
    
    @objc public var right: CGFloat {
        get {
            return left + width
        }
        set {
            frame = CGRect(x: newValue - width, y: top, width: width, height: height)
        }
    }
    
    @objc public var width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame = CGRect(x: left, y: top, width: newValue, height: height)
        }
    }
    
    @objc public var height: CGFloat {
        get {
            return frame.height
        }
        set {
            frame = CGRect(x: left, y: top, width: width, height: newValue)
        }
    }
    
    @objc public var centerX: CGFloat {
        get {
            return center.x
        }
        set {
            center = CGPoint(x: newValue, y: centerY)
        }
    }
    
    @objc public var centerY: CGFloat {
        get {
            return center.y
        }
        set {
            center = CGPoint(x: centerX, y: newValue)
        }
    }
    
    @objc public var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame.origin = newValue
        }
    }
}

extension UIView {
    @objc open func setCornerRadius(_ radius: CGFloat, position: UIRectCorner = []) {
        if position == [] {
            layer.cornerRadius = radius
            layer.masksToBounds = true
            return
        }
        let rect = bounds
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: position, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    private func drawRectWithRoundedCorner(radius: CGFloat,
                                   backgroundColor: UIColor,
                                   borderWidth: CGFloat = 0,
                                   borderColor: UIColor = .clear) -> UIImage? {
        let sizeToFit = CGSize(width: bounds.size.width, height: bounds.size.height)
        let halfBorderWidth = CGFloat(borderWidth / 2.0)
        UIGraphicsBeginImageContextWithOptions(sizeToFit, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setLineWidth(borderWidth)
        context.setStrokeColor(borderColor.cgColor)
        context.setFillColor(backgroundColor.cgColor)
        let width = sizeToFit.width, height = sizeToFit.height
        context.move(to: CGPoint.init(x: width - halfBorderWidth, y: radius + halfBorderWidth))
        context.addArc(tangent1End: CGPoint.init(x: width - halfBorderWidth, y: height - halfBorderWidth), tangent2End: CGPoint.init(x: width - radius - halfBorderWidth, y: height - halfBorderWidth), radius: radius)
        context.addArc(tangent1End: CGPoint.init(x: halfBorderWidth, y: height - halfBorderWidth), tangent2End: CGPoint.init(x: halfBorderWidth, y: height - radius - halfBorderWidth), radius: radius)
        context.addArc(tangent1End: CGPoint.init(x: halfBorderWidth, y: halfBorderWidth), tangent2End: CGPoint.init(x: width - halfBorderWidth, y: halfBorderWidth), radius: radius)
        context.addArc(tangent1End: CGPoint.init(x: width - halfBorderWidth, y: halfBorderWidth), tangent2End: CGPoint.init(x: width - halfBorderWidth, y: radius + halfBorderWidth), radius: radius)
        UIGraphicsGetCurrentContext()?.drawPath(using: .fillStroke)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return output
    }
    // 以插入图片的方式，做个圆角的假象。不能裁剪子试图
    @objc public func addCorner(radius: CGFloat,
                   backgroundColor: UIColor,
                   borderWidth: CGFloat = 0,
                   borderColor: UIColor = .clear) {
        guard let image = drawRectWithRoundedCorner(radius: radius, backgroundColor: backgroundColor, borderWidth: borderWidth, borderColor: borderColor) else { return }
        let imageView = UIImageView(image: image)
        insertSubview(imageView, at: 0)
        self.backgroundColor = .clear
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    @discardableResult
    @objc public func addLeftBorder(_ color: UIColor) -> CALayer {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: 0, y: 0, width: 0.5, height: self.height)
        borderLayer.backgroundColor = color.cgColor
        layer.addSublayer(borderLayer)
        return borderLayer
    }
    
    @discardableResult
    @objc public func addRightBorder(_ color: UIColor) -> CALayer {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: self.width-0.5, y: 0, width: 0.5, height: self.height)
        borderLayer.backgroundColor = color.cgColor
        layer.addSublayer(borderLayer)
        return borderLayer
    }
    
    @discardableResult
    @objc public func addTopBorder(_ color: UIColor) -> CALayer {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: 0, y: 0, width: self.width, height: 0.5)
        borderLayer.backgroundColor = color.cgColor
        layer.addSublayer(borderLayer)
        return borderLayer
    }
    
    @discardableResult
    @objc public func addBottomBorder(_ color: UIColor) -> CALayer {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: 0, y: self.height-0.5, width: self.width, height: 0.5)
        borderLayer.backgroundColor = color.cgColor
        layer.addSublayer(borderLayer)
        return borderLayer
    }

}

//MARK:- Hiarachy
extension UIView {
    @objc public var viewController: UIViewController? {
        var view: UIView? = self
        repeat {
            if let vc = view?.next as? UIViewController {
                return vc
            }
            view = view?.superview
        } while view != nil
        return nil
    }
    
    @objc public func removeAllSubviews() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func findNearestSuperView(superClass: AnyClass) -> UIView? {
        var superView = self.superview
        while superView != nil {
            if superView!.isKind(of: superClass) {
                return superView
            }
            superView = superView!.superview
        }
        return nil
    }
    
    func findViewControllerOfSuperView(specVCClass: AnyClass) -> UIViewController? {
        var superView: UIView? = self
        while superView != nil {
            if let nextResponder = superView?.next, nextResponder.isKind(of: specVCClass) {
                return nextResponder as? UIViewController
            }
            superView = superView?.superview
        }
        return nil
    }
}

//MARK:- Walk
extension UIView {
    public func bfsWalkSubview(_ block: (UIView) -> Bool) {
        subviews.forEach {
            if block($0) {
                return
            }
        }
        subviews.forEach {
            $0.bfsWalkSubview(block)
        }
    }
    
    public func dfsWalkSubview(_ block: (UIView) -> Bool) {
        subviews.forEach {
            if block($0) {
                return
            }
            $0.dfsWalkSubview(block)
        }
    }
}

//MARK:- Image
extension UIView {
    public func toImage() -> UIImage? {
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        context.map { layer.render(in: $0) }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIView {
    @objc public func addTapAction(_ action: Selector?, target: Any?) {
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
}

