//
//  NoteCell.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/24.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

class NoteCell: UICollectionViewCell {
    var model: Note? {
        didSet {
            if let note = model {
                labelTitle.text = note.title
                labelContent.text = note.content
                labelDate.text = note.updateDate.toString(with: .yyyyMMddHHmm)
            }
        }
    }
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        
        self.setCornerRadius(12)
    }
}
