//
//  RatingReviewCell.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 13/08/24.
//

import UIKit
import Cosmos

class RatingReviewCell: UITableViewCell {

    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var lbl_DateTime: UILabel!
    @IBOutlet weak var cosmosVw: CosmosView!
    @IBOutlet weak var lbl_Raing: UILabel!
    @IBOutlet weak var lbl_Message: UILabel!

    @IBOutlet weak var profileImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_Name.font = UIFont(name: "Cairo-Bold", size: 14)
        lbl_DateTime.font = UIFont(name: "Cairo-Regular", size: 10)
        
        lbl_Raing.font = UIFont(name: "Cairo-Regular", size: 12)
        lbl_Message.font = UIFont(name: "Cairo-Regular", size: 14)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
