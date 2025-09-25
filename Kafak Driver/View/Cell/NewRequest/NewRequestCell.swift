//
//  NewRequestCell.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 21/02/25.
//

import UIKit
import Cosmos

class NewRequestCell: UITableViewCell {

    @IBOutlet weak var user_Img: UIImageView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var viewActions: UIView!
    
    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_DateTime: UILabel!
    @IBOutlet weak var ratingStar: CosmosView!
    @IBOutlet weak var lbl_RatingCount: UILabel!
    @IBOutlet weak var lbl_Request: UILabel!
    @IBOutlet weak var lbl_RequestStatus: UILabel!
    @IBOutlet weak var lbl_Distance: UILabel!
    @IBOutlet weak var lbl_Amount: UILabel!
    @IBOutlet weak var lbl_CartCount: UILabel!
    @IBOutlet weak var lbl_Quantity: UILabel!
    
    @IBOutlet weak var btn_AcceptOt: UIButton!
    @IBOutlet weak var btn_SendOfferOt: UIButton!
    @IBOutlet weak var btn_Reject: UIButton!
    @IBOutlet weak var blank1: UIButton!
    @IBOutlet weak var blank2: UIButton!
    
    
    var cloSendOffer: () -> Void = {}
    var cloAccept: () -> Void = {}
    var cloReject: () -> Void = {}
    var cloPlus: () -> Void = {}
    var cloMinus: () -> Void = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_UserName.font = UIFont(name: "Cairo-Bold", size: 12)
        lbl_DateTime.font = UIFont(name: "Cairo-Regular", size: 10)

        lbl_RatingCount.font = UIFont(name: "Cairo-Regular", size: 12)
        
        lbl_Request.font = UIFont(name: "Cairo-Regular", size: 12)
        lbl_RequestStatus.font = UIFont(name: "Cairo-Regular", size: 12)
        
        lbl_Distance.font = UIFont(name: "Cairo-Bold", size: 10)
        lbl_Amount.font = UIFont(name: "Cairo-Regular", size: 14)
        
        btn_AcceptOt.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12)
        btn_SendOfferOt.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12)
        btn_Reject.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func btn_Plus(_ sender: UIButton) {
        self.cloPlus()
    }
    
    @IBAction func btn_Minus(_ sender: UIButton) {
        self.cloMinus()
    }
    
    @IBAction func btn_SendOffer(_ sender: UIButton) {
        self.cloSendOffer()
    }
    
    @IBAction func btn_Accept(_ sender: UIButton) {
        self.cloAccept()
    }
    
    @IBAction func btn_Reject(_ sender: UIButton) {
        self.cloReject()
    }
}
