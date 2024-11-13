//
//  RequestCell.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/08/24.
//

import UIKit

class RequestCell: UITableViewCell {

    var cloMakeOffer:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btn_MakeOffers(_ sender: UIButton) {
        self.cloMakeOffer?()
    }
}
