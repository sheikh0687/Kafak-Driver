//
//  VehicleTypeCell.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 21/02/25.
//

import UIKit

class VehicleTypeCell: UITableViewCell {

    @IBOutlet weak var vehicelImg: UIImageView!
    @IBOutlet weak var lbl_VehicleName: UILabel!
    @IBOutlet weak var img_Checked: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_VehicleName.font = UIFont(name: "Cairo-Regular", size: 14)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
