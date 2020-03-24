//
//  BookCell.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/22.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    @IBOutlet weak var markRightConstraint: NSLayoutConstraint!
    var model: Book? {
        didSet {
            if let book = model {
                name.text = book.title
                if book.author.stringValue.count == 0 {
                    author.text = NSLocalizedString("Anonymous", comment: "")
                }else {
                    author.text = book.author.stringValue
                }
                
                guard let imgData = book.coverImg else {
                    cover.backgroundColor = UIColor.random
                    return
                }
                cover.image = UIImage(data: imgData)
            }
        }
    }
    
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.tmGray.cgColor
        self.clipsToBounds = true
        
        markRightConstraint.constant = self.width*0.05
    }
}
