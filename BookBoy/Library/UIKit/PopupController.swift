//
//  PopupController.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/22.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation
import UIKit
import FXBlurView

@available(iOSApplicationExtension, unavailable)
@objc(PopupStyle)
public enum PopupStyle: UInt {
    case actionSheet
    case center
    case custom
}

@available(iOSApplicationExtension, unavailable)
public protocol PopupControllerDelegate: class {
    func popupControllerWillPresentView(view: UIView)
    func popupControllerDidPresentView(view: UIView)
    func popupControllerWillDismissView(view: UIView)
    func popupControllerDidDismissView(view: UIView)
}

@available(iOSApplicationExtension, unavailable)
extension PopupControllerDelegate {
    public func popupControllerWillPresentView(view: UIView) {}
    public func popupControllerDidPresentView(view: UIView) {}
    public func popupControllerWillDismissView(view: UIView) {}
    public func popupControllerDidDismissView(view: UIView) {}
}

@available(iOSApplicationExtension, unavailable)
@objc(PopupController)
public class PopupController: NSObject {
    public var style: PopupStyle
    public var startFrame: CGRect
    public var endFrame: CGRect
    public var verticalInset: CGFloat
    public var duration: Double
    public var layerColor: UIColor
    public var shadowColor: UIColor
    public var shadowRadius: CGFloat
    public var shadowOffset: CGSize
    public var shadowOpacity: Float
    public var overlayViewBackgroundColor: UIColor
    public var autoDismiss: Bool
    public var dismissWhenTapedPresentedView: Bool
    public weak var delegate: PopupControllerDelegate?
    
    private weak var targetView: UIView!
    private var contentView: UIView!
    
    private var strong: PopupController?
    
    public override init() {
        style = .actionSheet
        startFrame = .zero
        endFrame = .zero
        verticalInset = 0
        duration = 0.2
        layerColor = .black
        shadowColor = layerColor
        shadowRadius = 3
        shadowOffset = .zero
        shadowOpacity = 0.5
        overlayViewBackgroundColor = UIColor(hex: 0x000000, alpha: 0.64)
        autoDismiss = true
        dismissWhenTapedPresentedView = false
    }
    
    @objc public func presentView(_ view: UIView) {
        presentView(view, style: .actionSheet)
    }
    
    @objc public func presentView(_ view: UIView, style: PopupStyle) {
        presentView(view, style: style, blurRadius: 0)
    }
    
    @objc public func presentView(_ view: UIView, style: PopupStyle, blurRadius: CGFloat) {
        guard let window = UIApplication.shared.windows.last else { return }
        presentView(view, style: style, blurRadius: blurRadius, inView: window)
    }
    
    @objc public func presentView(_ view: UIView, style: PopupStyle, blurRadius: CGFloat, inView: UIView) {
        guard targetView == nil else { return }
        
        strong = self
        self.style = style
        targetView = view
        let targetSize = targetView.frame.size
        let windowBounds = inView.bounds
        if blurRadius > 0 {
            let blurView = FXBlurView(frame: windowBounds)
            blurView.tintColor = overlayViewBackgroundColor
            blurView.blurRadius = blurRadius
            contentView = blurView
        } else {
            contentView = UIView(frame: windowBounds)
            contentView.backgroundColor = overlayViewBackgroundColor
            contentView.alpha = 0
        }
        contentView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.overlayTaped(tap:)))
        tap.cancelsTouchesInView = false
        contentView.addGestureRecognizer(tap)
        contentView.addSubview(targetView)
        inView.addSubview(contentView)
        targetView.layer.shadowColor = shadowColor.cgColor
        targetView.layer.shadowOffset = shadowOffset
        targetView.layer.shadowRadius = shadowRadius
        targetView.layer.shadowOpacity = shadowOpacity
        targetView.layer.shouldRasterize = true
        targetView.layer.rasterizationScale = UIScreen.main.scale
        
        delegate?.popupControllerWillPresentView(view: targetView)
        let completion: ((Bool) -> Void) = { _ -> Void in
            self.delegate?.popupControllerDidPresentView(view: self.targetView)
            return ()
        }
        switch style {
        case .actionSheet:
            let x = (contentView.width - targetSize.width) / 2
            let startFrame = CGRect(x: x, y: contentView.height, width: targetSize.width, height: targetSize.height)
            let endFrame = CGRect(x: x, y: contentView.height - targetSize.height, width: targetSize.width, height: targetSize.height)
            targetView.frame = startFrame
            UIView.animate(withDuration: duration, animations: {
                self.contentView.alpha = 1
                self.targetView.frame = endFrame
            }, completion: completion)
        case .center:
            let x = (contentView.width - targetSize.width) / 2
            let y = (contentView.height - targetSize.height) / 2
            var frame = CGRect(x: x, y: y, width: targetSize.width, height: targetSize.height)
            frame = frame.offsetBy(dx: 0, dy: verticalInset)
            targetView.frame = frame
            targetView.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
            UIView.animate(withDuration: duration, animations: {
                self.contentView.alpha = 1
                self.targetView.transform = CGAffineTransform.identity
            }, completion: completion)
        case .custom:
            targetView.frame = startFrame
            UIView.animate(withDuration: duration, animations: {
                self.contentView.alpha = 1
                self.targetView.frame = self.endFrame
            }, completion: completion)
        }
        RunLoop.current.run(until: Date(timeIntervalSinceNow: duration))
    }
    
    @objc public func dismiss() {
        guard let targetView = targetView else {
            return
        }
        delegate?.popupControllerWillDismissView(view: targetView)
        let completion: (Bool) -> Void = { finish in
            self.contentView.removeFromSuperview()
            self.delegate?.popupControllerDidDismissView(view: self.targetView)
            targetView.removeFromSuperview()
            self.targetView = nil
            self.strong = nil
        }
        var dismissFrame: CGRect = .zero
        switch style {
        case .actionSheet:
            dismissFrame = targetView.frame
            dismissFrame.origin.y = contentView.height
            UIView.animate(withDuration: duration, animations: {
                self.contentView.alpha = 0
                self.targetView.frame = dismissFrame
            }, completion: completion)
        case .center:
            UIView.animate(withDuration: duration, animations: {
                self.contentView.alpha = 0
            }, completion: completion)
        case .custom:
            dismissFrame = startFrame
            UIView.animate(withDuration: duration, animations: {
                self.contentView.alpha = 0
                self.targetView.frame = dismissFrame
            }, completion: completion)
        }
        RunLoop.current.run(until: Date(timeIntervalSinceNow: duration))
    }
    
    @objc private func overlayTaped(tap: UIGestureRecognizer) {
        let point = tap.location(in: contentView)
        if targetView.frame.contains(point) {
            if dismissWhenTapedPresentedView {
                dismiss()
            }
        } else {
            if autoDismiss {
                dismiss()
            }
        }
    }
}
