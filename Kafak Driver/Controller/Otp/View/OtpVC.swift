//
//  OtpVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 29/08/25.
//

import UIKit
import OTPFieldView

class OtpVC: UIViewController {
    
    @IBOutlet var otpTextFieldView: OTPFieldView!
    @IBOutlet weak var lbl_UserNumber: UILabel!
    
    let viewModel = OtpViewModel()
    let VM = LoginViewModel()
    
    var isComingFrom: String?
    var strPassword:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupOtpView(for: otpTextFieldView)
        self.lbl_UserNumber.text = viewModel.mobileNum
    }
    
    @IBAction func btn_Back(_ sender: UIButton) {
        viewModel.returnBackk(from: self.navigationController)
    }
    
    @IBAction func btn_Resend(_ sender: UIButton) {
        viewModel.cloResendOtp?(self)
    }
    
    @IBAction func btn_Verification(_ sender: UIButton) {
        if viewModel.validateInput() {
            if isComingFrom == "Signup" {
                viewModel.requestToRegister(vC: self)
                viewModel.registerSuccessful = { [weak self] in
                    guard let self else { return }
                    
                    self.VM.updateLanguage(vC: self, appLan: L102Language.currentAppleLanguage())
                    self.VM.cloUpdateLanguage = { [weak self] in
                        Utility.showAlertWithAction(withTitle: k.appName, message: R.string.localizable.congratulationYourAccountHasBeenCreatedSuccessfully(), delegate: nil, parentViewController: self!) { [weak self] bool in
                            guard let self else { return }
                            
                            let vC = Kstoryboard.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
                            vC.isFrom = "Register"
                            self.navigationController?.pushViewController(vC, animated: true)
                        }
                    }
                }
            } else {
                let vC = Kstoryboard.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
                vC.isComingFrom = "ForgetPassword"
                vC.userPassword = self.strPassword
                self.navigationController?.pushViewController(vC, animated: true)

            }
        } else {
            Utility.showAlertMessage(withTitle: k.appName, message: self.viewModel.errorMessage, delegate: nil, parentViewController: self)
        }
    }
}

