//
//  ConfirmPaymentPopup.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 03/03/25.
//

import UIKit

class ConfirmPaymentPopup: UIViewController {

    @IBOutlet weak var lbl_AmountDetail: UILabel!
    
    var cloConfirm:(()->Void)?
    var cloNavigateToHelp:(() -> Void)?
    var strAmountDetail:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbl_AmountDetail.text = "\(R.string.localizable.haveYouReceivedTheAmountOf()): \(strAmountDetail ?? "") SR?"
        
    }
    
    @IBAction func btn_Confirm(_ sender: UIButton) {
        self.cloConfirm?()
        self.dismiss(animated: true)
    }
    
    @IBAction func btn_No(_ sender: UIButton) {
        Utility.showAlertYesNoAction(withTitle: R.string.localizable.help(), message: R.string.localizable.ifYouWantAnySupportFromAdminThenYouCanWriteHim(), delegate: nil, parentViewController: self) { bool in
            if bool {
                self.cloNavigateToHelp?()
                self.dismiss(animated: true)
            } else {
                self.dismiss(animated: true)
            }
        }
    }
}
