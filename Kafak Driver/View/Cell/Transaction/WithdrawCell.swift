//
//  WithdrawCell.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 13/08/24.
//

import UIKit

class WithdrawCell: UITableViewCell {

    @IBOutlet weak var lbl_AvailableAmount: UILabel!
    @IBOutlet weak var lbl_DateTime: UILabel!
    @IBOutlet weak var btn_Status: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_AvailableAmount.font = UIFont(name: "Cairo-Bold", size: 14)
        lbl_DateTime.font = UIFont(name: "Cairo-Regular", size: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
