//
//  WalletSuccessPopUp.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 22/04/25.
//

import UIKit

class WalletSuccessPopUp: UIViewController {

    var cloSuccessPopUp : (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btn_Ok(_ sender: UIButton) {
        cloSuccessPopUp?()
        self.dismiss(animated: true)
    }
}
