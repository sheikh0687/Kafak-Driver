//
//  PresentForWalletAmountVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/04/25.
//

import UIKit

class PresentForWalletAmountVC: UIViewController {
    
    @IBOutlet weak var txt_Amount: UITextField!
    @IBOutlet weak var view_Main: UIView!
    
    var cloAdd: ((String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view_Main.roundCorners(corners: [.topLeft, .topRight], radius: 60)
    }
    
    @IBAction func btn_Add(_ sender: UIButton) {
        if txt_Amount.text!.isEmpty {
            self.alert(alertmessage: R.string.localizable.pleaseEnterAmount())
        } else {
            self.cloAdd?(self.txt_Amount.text ?? "")
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func btn_Cancel(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
