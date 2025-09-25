//
//  AdminContactCell.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 07/04/25.
//

import UIKit

class AdminContactCell: UITableViewCell {

    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_Query: UILabel!
    @IBOutlet weak var lbl_DateTime: UILabel!
    @IBOutlet weak var lbl_Count: UILabel!
    @IBOutlet weak var notificationVw: UIView!
    
    var cloChat:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lbl_Count.roundCorners1(corners: [.allCorners], radius: 9)
        lbl_UserName.font = UIFont(name: "Cairo-Bold", size: 16)
        lbl_Query.font = UIFont(name: "Cairo-Regular", size: 14)
        lbl_DateTime.font = UIFont(name: "Cairo-Light", size: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btn_Chat(_ sender: UIButton) {
        self.cloChat?()
    }
}
