//
//  MessageCell.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/21.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
