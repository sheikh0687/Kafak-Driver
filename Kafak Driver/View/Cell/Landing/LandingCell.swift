//
//  LandingCell.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/08/24.
//

import UIKit

class LandingCell: UICollectionViewCell {

    @IBOutlet weak var lbl_Main: UILabel!
    @IBOutlet weak var lbl_Sub: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_Main.font = UIFont(name: "Cairo-Bold", size: 16)
        lbl_Sub.font = UIFont(name: "Cairo-Regular", size: 14)
    }
}
