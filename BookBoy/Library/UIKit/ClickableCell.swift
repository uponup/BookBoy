//
//  ClickableCell.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/24.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit
import SnapKit

class ClickableCell: UIControl {
    
    public static var lineColor = UIColor(hex: 0xd4d4d4)
    public static var arrowImage: UIImage? = UIKitBundle.arrowRightImage

    public var lineColor: UIColor = ClickableCell.lineColor {
        didSet {
            bottomLine.backgroundColor = lineColor
        }
    }
    
    public var accessoryIndent: Float = 13 {
        didSet {
            accessoryView.snp.updateConstraints {
                $0.right.equalToSuperview().inset(accessoryIndent)
            }
        }
    }
    
    public let bottomLine = UIView()
    public let accessoryView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        commonInit()
        accessoryView.image = #imageLiteral(resourceName: "cell_arrow_right")
    }
    
    func commonInit() {
        bottomLine.backgroundColor = lineColor
        addSubview(bottomLine)
        bottomLine.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(13)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
        accessoryView.image = ClickableCell.arrowImage
        addSubview(accessoryView)
        accessoryView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(self.accessoryIndent)
        }
    }
}
