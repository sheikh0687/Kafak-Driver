//
//  NotificationCell.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/08/24.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var lbl_NotificationTitle: UILabel!
    @IBOutlet weak var lbl_Description: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_NotificationTitle.font = UIFont(name: "Cairo-Bold", size: 12)
//        lbl_Description.font = UIFont(name: "Cairo-Regular", size: 10)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
