//
//  SignupVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/08/24.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var txt_FirstName: UITextField!
    @IBOutlet weak var txt_LastName: UITextField!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_MobileNum: UITextField!
    @IBOutlet weak var txt_CountryPicker: UITextField!
    @IBOutlet weak var btn_CountryPickerOt: UIButton!
    
    @IBOutlet weak var txt_Address: UITextField!
    @IBOutlet weak var txt_Password: UITextField!
    @IBOutlet weak var txt_ConfirmPassword: UITextField!
    @IBOutlet weak var btn_LoginNowOt: UIButton!
    @IBOutlet weak var lbl_TermsCondition: UILabel!
    
    let viewModel = SignupViewModel()
    
    var strCheck = ""
    var iconClick = true
    
    var strCCode:String! = "966"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.txt_Password.delegate = self
        self.txt_ConfirmPassword.delegate = self

        viewModel.configureAttributedText(for: btn_LoginNowOt)
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(addressPicker))
        txt_Address.isUserInteractionEnabled = true
        txt_Address.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(termsCondition))
        lbl_TermsCondition.isUserInteractionEnabled = true
        lbl_TermsCondition.addGestureRecognizer(tapGesture2)

        setUpBinding()
    }
    
    @IBAction func btn_Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addressPicker()
    {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "AddressPickerVC") as! AddressPickerVC
        vC.locationPickedBlock = { (addressCordinate, latVal, lonVal, addressVal) in
            self.txt_Address.text = addressVal
            self.viewModel.userLat = latVal
            self.viewModel.userLon = lonVal
        }
        self.present(vC, animated: true, completion: nil)
    }
    
    @objc func termsCondition()
    {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "TermConditionVC") as! TermConditionVC
        vC.viewModel.strType = "TermsCondition"
        self.navigationController?.pushViewController(vC, animated: true)
    }

    @IBAction func btn_CountryPicker(_ sender: UIButton) {
        print("Country Picker Tapped!!")
        let countryListVC = CountryList()
        countryListVC.delegate = self
        let navController = UINavigationController(rootViewController: countryListVC)
        self.present(navController, animated: true, completion: nil)
    }
    
    @IBAction func btn_TogglePassword(_ sender: UIButton) {
        if(iconClick == true) {
            txt_Password.isSecureTextEntry = false
            sender.setImage(R.image.view(), for: .normal)
        } else {
            txt_Password.isSecureTextEntry = true
            sender.setImage(R.image.view_eye(), for: .normal)
        }
        iconClick = !iconClick
    }

    @IBAction func btn_ToggleConfirmPassword(_ sender: UIButton) {
        if(iconClick == true) {
            txt_ConfirmPassword.isSecureTextEntry = false
            sender.setImage(R.image.view(), for: .normal)
        } else {
            txt_ConfirmPassword.isSecureTextEntry = true
            sender.setImage(R.image.view_eye(), for: .normal)
        }
        iconClick = !iconClick
    }
    
    @IBAction func btn_Check(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            strCheck = ""
            sender.setImage(R.image.rectangleUncheck(), for: .normal)
        } else {
            strCheck = "Val"
            sender.isSelected = true
            sender.setImage(R.image.rectangleChecked(), for: .normal)
        }
    }
    
    @IBAction func btn_Register(_ sender: UIButton) {
        viewModel.phoneKey = self.strCCode
        viewModel.userFirstName = txt_FirstName.text ?? ""
        viewModel.userLastName = txt_LastName.text ?? ""
        viewModel.userEmail = txt_Email.text ?? ""
        viewModel.userMobile = txt_MobileNum.text ?? ""
        viewModel.userPassword = txt_Password.text ?? ""
        viewModel.userConfirmPassword = txt_ConfirmPassword.text ?? ""
        viewModel.strCheck = strCheck
        viewModel.userAddress = txt_Address.text ?? ""
        viewModel.WebVerifyNumber(vC: self)
    }
    
    @IBAction func btn_Login(_ sender: UIButton) {
        viewModel.returnBack(from: self.navigationController)
    }
    
    private func setUpBinding()
    {
        viewModel.showErrorMessage = { [weak self] in
            if let errorMessage = self?.viewModel.errorMessage {
                Utility.showAlertMessage(withTitle: k.appName, message: errorMessage, delegate: nil, parentViewController: self!)
            }
        }
        
        viewModel.cloSuccessfullSendOtp = { [weak self] in
            guard let self else { return }
            
            let vC = Kstoryboard.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
            vC.isComingFrom = "Signup"
            vC.viewModel.mobileNum = self.txt_MobileNum.text ?? ""
            vC.viewModel.cloResendOtp = { [weak self] vC in
                self?.viewModel.WebVerifyNumber(vC: vC)
            }
            self.navigationController?.pushViewController(vC, animated: true)
        }
    }
}

extension SignupVC: CountryListDelegate {
    func selectedCountry(country: Country) {
        strCCode = "\(country.phoneExtension)"
        print(strCCode!)
        
        let displayName = country.name ?? country.countryCode
        btn_CountryPickerOt.setTitle("+\(strCCode!)", for: .normal)
        k.userDefault.set(strCCode!, forKey: k.session.mobileCode)
        print("Selected country:", displayName, strCCode!)
    }
}

extension SignupVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == txt_Password {
            // Workaround for iOS secureTextEntry cursor reset issue
            if textField.isSecureTextEntry {
                // Capture current text
                if let currentText = textField.text as NSString? {
                    let updatedText = currentText.replacingCharacters(in: range, with: string)
                    textField.text = updatedText
                    
                    // Manually move cursor to end
                    let endPosition = textField.endOfDocument
                    textField.selectedTextRange = textField.textRange(from: endPosition, to: endPosition)
                    
                    return false // We already updated text manually
                }
            }
        } else if textField == txt_ConfirmPassword {
            if textField.isSecureTextEntry {
                // Capture current text
                if let currentText = textField.text as NSString? {
                    let updatedText = currentText.replacingCharacters(in: range, with: string)
                    textField.text = updatedText
                    
                    // Manually move cursor to end
                    let endPosition = textField.endOfDocument
                    textField.selectedTextRange = textField.textRange(from: endPosition, to: endPosition)
                    
                    return false // We already updated text manually
                }
            }
        }
        
        return true
    }
}
