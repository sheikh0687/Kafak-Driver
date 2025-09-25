//
//  LastChatCell.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 11/03/25.
//

import UIKit

class LastChatCell: UITableViewCell {

    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_MessageFrom: UILabel!
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lbl_DateTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_UserName.font = UIFont(name: "Cairo-Bold", size: 16)
        lbl_MessageFrom.font = UIFont(name: "Cairo-Regular", size: 14)
        lbl_DateTime.font = UIFont(name: "Cairo-Light", size: 12)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
