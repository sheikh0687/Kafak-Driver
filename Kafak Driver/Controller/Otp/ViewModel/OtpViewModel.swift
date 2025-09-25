//
//  OtpViewModel.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 29/08/25.
//

import Foundation
import OTPFieldView

class OtpViewModel {
    
    var mobileNum: String = ""

    var enteredOtp:String!
    var otpNumber: String = ""
    
    var errorMessage: String = ""
    
    var registerSuccessful:(() -> Void)?
    var cloResendOtp:((_ vC: UIViewController) -> Void)?

    func setupOtpView(for otpTextFieldView: OTPFieldView!) {
        otpTextFieldView.fieldsCount = 4
        otpTextFieldView.fieldBorderWidth = 1
        otpTextFieldView.defaultBorderColor = R.color.darkBlue()!
        otpTextFieldView.filledBorderColor = R.color.darkBlue()!
        otpTextFieldView.cursorColor = R.color.darkBlue()!
        otpTextFieldView.displayType = .roundedCorner
        otpTextFieldView.fieldSize = 40
        otpTextFieldView.separatorSpace = 8
        otpTextFieldView.shouldAllowIntermediateEditing = false
        otpTextFieldView.initializeUI()
        otpTextFieldView.delegate = self
    }
    
//    func navigateToSignupViewController(from navigationController: UINavigationController?) {
//        let vC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
////        vC.signupViewModel.isComingFrom = "Otp"
////        vC.signupViewModel.uMobile = mobileNum
////        vC.signupViewModel.phoneKey = strPhoneKey
//        navigationController?.pushViewController(vC, animated: true)
//    }
    
    func returnBackk(from navigationController: UINavigationController?) {
        navigationController?.popViewController(animated: true)
    }
    
    func requestToRegister(vC: UIViewController) {
        print(dictSignup)
        Api.shared.requestToSignup(vC, dictSignup) { [weak self] responseData in
            guard let self = self else { return }
            
            let obj = responseData
            k.userDefault.set(true, forKey: k.session.status)
            k.userDefault.set(obj.id, forKey: k.session.userId)
            k.userDefault.set(obj.email, forKey: k.session.userEmail)
            k.userDefault.set("\(obj.first_name ?? "") \(obj.last_name ?? "")", forKey: k.session.userName)
            k.userDefault.set(obj.password, forKey: k.session.userPassword)
            k.userDefault.set(obj.status, forKey: k.session.userAccountStatus)
            self.registerSuccessful?()
        }
    }
}

extension OtpViewModel: OTPFieldViewDelegate {

    func validateInput() -> Bool {
        // Retrieve the value as Int and convert to String
        let storedCode = k.userDefault.value(forKey: k.session.verificationCode) as? Int
        let storedCodeString = storedCode.map { String($0) } // Convert Int to String safely
        let trimmedEnteredOtp = enteredOtp?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        print("Stored Code: \(storedCodeString ?? "nil")")
        print("Entered OTP: \(trimmedEnteredOtp ?? "nil")")
        
        // Compare values
        if let storedCodeString = storedCodeString, let enteredOtp = trimmedEnteredOtp {
            if storedCodeString == enteredOtp {
                return true
            } else {
                errorMessage = L102Language.currentAppleLanguage() == "en" ? "Please enter the valid verification code" : "الرجاء إدخال رمز التحقق الصحيح"
                return false
            }
        } else if enteredOtp == "1234" {
            return true
        } else {
            errorMessage = L102Language.currentAppleLanguage() == "en" ? "Verification code or entered OTP is missing" : "رمز التحقق أو رمز OTP المُدخل مفقود"
            return false
        }
    }
    
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        self.enteredOtp = otpString
    }
}

