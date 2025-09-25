//
//  ChatImageCell.swift
//  AskYourCommunity
//
//  Created by mac on 11/06/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ChatImageCell: UITableViewCell {

    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var imgRight: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
