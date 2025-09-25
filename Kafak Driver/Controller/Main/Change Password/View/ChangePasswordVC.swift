//
//  ChangePasswordVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 14/08/24.
//

import UIKit

class ChangePasswordVC: UIViewController {
    
    @IBOutlet weak var txt_OldPassword: UITextField!
    @IBOutlet weak var txt_NewPassword: UITextField!
    @IBOutlet weak var txt_ConfirmPassword: UITextField!
    
    let viewModel = ChangePasswordViewModel()
    
    var isComingFrom: String?
    var userPassword = ""
    var decodedString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txt_OldPassword.delegate = self
        self.txt_NewPassword.delegate = self
        self.txt_ConfirmPassword.delegate = self
        convertIntoString()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.resetPassword(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func convertIntoString()
    {
        if let data = Data(base64Encoded: userPassword),
           let decodedString = String(data: data, encoding: .utf8) {
            print("Decoded String: \(decodedString)")
            self.decodedString = decodedString
        } else {
            print("Invalid Base64 string")
        }
    }
    
    @IBAction func btn_Submit(_ sender: UIButton) {
        if isValidInputs() {
            requestToChangePassword()
        }
    }
}

extension ChangePasswordVC {
    
    func requestToChangePassword()
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["old_password"] = txt_OldPassword.text  as AnyObject
        paramDict["password"] = txt_NewPassword.text as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToChangePassword(self, paramDict) { [weak self] responseData in
            guard let self else { return }
            
            if responseData.status == "1" {
                Utility.showAlertWithAction(withTitle: k.appName, message: R.string.localizable.yourPasswordHasBeenSuccessfullyChanged(), delegate: nil, parentViewController: self) { bool in
                    isLogout = true
                    Switcher.updateRootVC()
                }
            } else {
                print("Something went wrong")
            }
        }
    }
    
    func isValidInputs() -> Bool {
        var message: String? = nil
        
//        if (txt_OldPassword.text?.isEmpty ?? true) {
//            message = L102Language.currentAppleLanguage() == "en" ?
//            "Please enter your old password." :
//            (L102Language.currentAppleLanguage() == "ar" ?
//             "الرجاء إدخال كلمة المرور القديمة." :
//                "براہ کرم اپنا پرانا پاس ورڈ درج کریں۔")
//        } else if decodedString != txt_OldPassword.text {
//            message = L102Language.currentAppleLanguage() == "en" ?
//            "The old password you entered is incorrect." :
//            (L102Language.currentAppleLanguage() == "ar" ?
//             "كلمة المرور القديمة التي أدخلتها غير صحيحة." :
//                "آپ کا درج کردہ پرانا پاس ورڈ غلط ہے۔")
//        } else
        
        if (txt_NewPassword.text?.isEmpty ?? true) {
            message = L102Language.currentAppleLanguage() == "en" ?
            "Please enter a new password." :
            (L102Language.currentAppleLanguage() == "ar" ?
             "الرجاء إدخال كلمة مرور جديدة." :
                "براہ کرم نیا پاس ورڈ درج کریں۔")
        } else if decodedString == txt_NewPassword.text || userPassword == txt_NewPassword.text {
            message = L102Language.currentAppleLanguage() == "en" ?
            "New password cannot be the same as the old password." :
            (L102Language.currentAppleLanguage() == "ar" ?
             "لا يمكن أن تكون كلمة المرور الجديدة هي نفسها كلمة المرور القديمة." :
                "نیا پاس ورڈ پرانے پاس ورڈ جیسا نہیں ہو سکتا۔")
        } else if (txt_ConfirmPassword.text?.isEmpty ?? true) {
            message = L102Language.currentAppleLanguage() == "en" ?
            "Please confirm your new password." :
            (L102Language.currentAppleLanguage() == "ar" ?
             "الرجاء تأكيد كلمة المرور الجديدة." :
                "براہ کرم نیا پاس ورڈ دوبارہ درج کریں۔")
        } else if txt_NewPassword.text != txt_ConfirmPassword.text {
            message = L102Language.currentAppleLanguage() == "en" ?
            "Passwords do not match. Please enter the same password." :
            (L102Language.currentAppleLanguage() == "ar" ?
             "كلمات المرور غير متطابقة. الرجاء إدخال نفس كلمة المرور." :
                "پاس ورڈز میچ نہیں کرتے۔ براہ کرم ایک ہی پاس ورڈ درج کریں۔")
        }
        
        if let msg = message {
            self.alert(alertmessage: msg)
            return false
        }
        return true
    }
    
    //    func isValidInputs() -> Bool {
    //        if (txt_OldPassword.text?.isEmpty)! {
    //            self.alert(alertmessage: R.string.localizable.pleaseEnterThePassword())
    //            return false
    //        } else if decodedString != txt_OldPassword.text {
    //            self.alert(alertmessage: R.string.localizable.pleaseEnterThePassword())
    //            return false
    //        } else if (txt_NewPassword.text?.isEmpty)! {
    //            self.alert(alertmessage: R.string.localizable.pleaseEnterTheNewPassword())
    //            return false
    //        } else if decodedString == txt_NewPassword.text {
    //            self.alert(alertmessage: R.string.localizable.pleaseEnterTheNewPassword())
    //            return false
    //        } else if (txt_ConfirmPassword.text?.isEmpty)! {
    //            self.alert(alertmessage: R.string.localizable.pleaseConfirmThePassword())
    //            return false
    //        } else if txt_NewPassword.text != txt_ConfirmPassword.text {
    //            self.alert(alertmessage: R.string.localizable.passwordMismatchedPleaseEnterTheSamePassword())
    //            return false
    //        }
    //        return true
    //    }
}

extension ChangePasswordVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == txt_OldPassword {
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
        } else if textField == txt_NewPassword {
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
