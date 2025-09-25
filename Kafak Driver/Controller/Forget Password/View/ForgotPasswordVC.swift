//
//  ForgotPasswordVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/08/24.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    @IBOutlet weak var txt_Mobile: UITextField!
    @IBOutlet weak var btn_CountryPickerOt: UIButton!
    
    var strCCode:String! = "966"
    var userPassword: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txt_Mobile.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: "", CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btn_Send(_ sender: UIButton) {
        if (txt_Mobile.text?.isEmpty)! {
            self.alert(alertmessage: R.string.localizable.pleaseEnterTheMobileNumber())
        } else if !Utility.isValidMobileNumber(txt_Mobile.text ?? "") {
            self.alert(alertmessage: L102Language.currentAppleLanguage() == "en" ? "Please enter the valid mobile number" : "الرجاء إدخال رقم جوال صالح")
        } else {
            WebVerifyNumber()
        }
    }
    
    @IBAction func btn_CountryPicker(_ sender: UIButton) {
        print("Country Picker Tapped!!")
        let countryListVC = CountryList()
        countryListVC.delegate = self
        let navController = UINavigationController(rootViewController: countryListVC)
        self.present(navController, animated: true, completion: nil)
    }
}

// MARK: NETWORK MANAGMENT
extension ForgotPasswordVC {
    
    func WebVerifyNumber(shouldNavigate: Bool = true) {
        
        var param: [String : AnyObject] = [:]
        param["mobile"] = txt_Mobile.text as AnyObject
        param["mobile_with_code"] = "\(strCCode ?? "")\(txt_Mobile.text ?? "")" as AnyObject
        param["type"] = "DRIVER" as AnyObject
        
        print(param)
        
        Api.shared.requestToSendOtpForResetPassword(self, param) { [weak self] responseData in
            guard let self else { return }
            print("The Verification code is: === \(responseData.code ?? "")")
            k.userDefault.set(responseData.code ?? "", forKey: k.session.verificationCode)
            k.userDefault.set(responseData.user_id ?? "", forKey: k.session.userId)
            if shouldNavigate {
                let vC = Kstoryboard.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
                vC.isComingFrom = "ForgetPassword"
                vC.strPassword = userPassword
                vC.viewModel.mobileNum = self.txt_Mobile.text ?? ""
                vC.viewModel.cloResendOtp = { [weak self] vC in
                    guard let self else { return }
                    self.WebVerifyNumber(shouldNavigate: false)
                }
                self.navigationController?.pushViewController(vC, animated: true)
            }
        }
    }

        
    func requestToResetPassword()
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["mobile"] = self.txt_Mobile.text as AnyObject
        paramDict["mobile_with_code"] = "\(strCCode ?? "")\(self.txt_Mobile.text ?? "")" as AnyObject
        paramDict["type"] = "USER" as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToResetPassword(self, paramDict) { [weak self] responseData in
            guard let self = self else { return }
            if responseData.status == "1" {
                Utility.showAlertWithAction(withTitle: k.appName, message: L102Language.currentAppleLanguage() == "en" ? "Your new password has been sent to your mobile number." : "تم إرسال كلمة المرور الجديدة إلى رقم جوالك.", delegate: nil, parentViewController: self) { bool in
                    self.dismiss(animated: true)
                }
            } else {
                self.alert(alertmessage: responseData.result ?? "")
            }
        }
    }
}

extension ForgotPasswordVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Get the full text after user's input
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)

        // Check if it's the first character and it's 0
        if newText.count == 1 && newText == "0" {
            // You can show an alert or just block it
            print("You can not start with 0")
            return false
        }

        return true
    }
}

extension ForgotPasswordVC: CountryListDelegate {
    func selectedCountry(country: Country) {
        strCCode = "\(country.phoneExtension)"
        print(strCCode!)
        
        let displayName = country.name ?? country.countryCode
        btn_CountryPickerOt.setTitle("+\(strCCode!)", for: .normal)
        k.userDefault.set(strCCode!, forKey: k.session.mobileCode)
        print("Selected country:", displayName, strCCode!)
    }
}
