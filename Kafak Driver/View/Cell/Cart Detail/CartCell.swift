//
//  CartCell.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 03/03/25.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var lbl_CartItemName: UILabel!
    @IBOutlet weak var lbl_CartItemPrice: UILabel!
    @IBOutlet weak var lbl_CartItemQuantity: UILabel!
    
    @IBOutlet weak var cartImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_CartItemName.font = UIFont(name: "Cairo-Bold", size: 14)
        lbl_CartItemPrice.font = UIFont(name: "Cairo-Regular", size: 12)
        lbl_CartItemQuantity.font = UIFont(name: "Cairo-Regular", size: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
