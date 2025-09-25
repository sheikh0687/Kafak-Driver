//
//  RequestCell.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/08/24.
//

import UIKit

class RequestCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_DateTime: UILabel!
    @IBOutlet weak var lbl_PickupAddress: UILabel!
    @IBOutlet weak var lbl_DropOffAddress: UILabel!
    @IBOutlet weak var lbl_RequestFor: UILabel!
    @IBOutlet weak var lbl_RequestStatus: UILabel!
    @IBOutlet weak var addressVw: UIStackView!
    @IBOutlet weak var lbl_Amount: UILabel!
    
    @IBOutlet weak var btn_ChatOt: UIButton!
    @IBOutlet weak var pickAddressVw: UIView!
    @IBOutlet weak var dropAddressVw: UIView!
    
    var cloChat:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_UserName.font = UIFont(name: "Cairo-Bold", size: 12)
        lbl_DateTime.font = UIFont(name: "Cairo-Regular", size: 10)
        
        lbl_PickupAddress.font = UIFont(name: "Cairo-Regular", size: 12)
        lbl_DropOffAddress.font = UIFont(name: "Cairo-Regular", size: 12)
        
        lbl_RequestFor.font = UIFont(name: "Cairo-Regular", size: 10)
        lbl_RequestStatus.font = UIFont(name: "Cairo-Regular", size: 10)
        
        lbl_Amount.font = UIFont(name: "Cairo-Bold", size: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btn_Chat(_ sender: UIButton) {
        self.cloChat?()
    }
}
