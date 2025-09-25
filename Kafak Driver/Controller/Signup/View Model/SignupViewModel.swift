//
//  SignupViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 20/09/24.
//

import Foundation
import UIKit

class SignupViewModel {
    
    var userFirstName = ""
    var userLastName = ""
    var userEmail = ""
    var userMobile = ""
    var userPassword = ""
    var userAddress = ""
    var userLat = 0.0
    var userLon = 0.0
    var userConfirmPassword = ""
    var strCheck = ""
    
    var registerSuccessful:(() -> Void)?
    var showErrorMessage:(() -> Void)?
    var cloSuccessfullSendOtp: (() -> Void)?
    
    var errorMessage: String? {
        didSet {
            self.showErrorMessage?()
        }
    }
    
    var phoneKey:String! = "966"
        
    func navigateToHomeVC(from navigationController: UINavigationController?,viewController: UIViewController) {
        Utility.showAlertWithAction(withTitle: k.appName, message: R.string.localizable.congratulationYourAccountHasBeenCreatedSuccessfully(), delegate: nil, parentViewController: viewController) { bool in
            Switcher.updateRootVC()
        }
    }
    
    func returnBack(from navigationController: UINavigationController?) {
        navigationController?.popViewController(animated: true)
    }
    
    func configureAttributedText(for button: UIButton) {
        let fullText = R.string.localizable.alreadyHaveAnAccountLoginNow()
        let highlightedText = R.string.localizable.loginNow()

        let attributedString = NSMutableAttributedString(string: fullText)

        // Set default color for the entire text
        attributedString.addAttribute(.foregroundColor, value: UIColor(cgColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), range: NSRange(location: 0, length: fullText.count))

        // Apply highlight attributes to "Login Now"
        let range = (fullText as NSString).range(of: highlightedText)
        attributedString.addAttribute(.foregroundColor, value: R.color.darkBlue()!, range: range)
        attributedString.addAttribute(.font, value: UIFont(name: "Avenir-Heavy", size: 14.0)!, range: range)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)

        // Set attributed text
        button.setAttributedTitle(attributedString, for: .normal)
    }
}

extension SignupViewModel {
    
    func isValidInput() -> Bool {
        if userFirstName.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterTheFirstName()
            return false
        } else if userLastName.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterTheLastName()
            return false
        } else if !Utility.isValidEmail(userEmail) {
            errorMessage = L102Language.currentAppleLanguage() == "en" ? "Please enter the valid email address" : "الرجاء إدخال عنوان بريد إلكتروني صالح"
            return false
        } else if !Utility.isValidMobileNumber(userMobile) {
            errorMessage = L102Language.currentAppleLanguage() == "en" ? "Please enter the valid mobile number" : "الرجاء إدخال رقم جوال صالح"
            return false
        } else if userPassword.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterThePassword()
            return false
        } else if userConfirmPassword.isEmpty {
            errorMessage = R.string.localizable.pleaseConfirmThePassword()
            return false
        } else if userPassword != userConfirmPassword {
            errorMessage = R.string.localizable.passwordMismatchedPleaseEnterTheSamePassword()
            return false
        } else if strCheck.isEmpty {
            errorMessage = R.string.localizable.pleaseReadTheTermsAndConditionsForProceed()
            return false
        }
        return true
    }
    
    func WebVerifyNumber(vC: UIViewController, shouldNavigate: Bool = true) {
        
        guard self.isValidInput() else { return }
        
        var param: [String : AnyObject] = [:]
        param["mobile"] = userMobile as AnyObject
        param["mobile_with_code"] = "\(phoneKey ?? "")\(userMobile)" as AnyObject
        param["type"] = "DRIVER" as AnyObject
        
        print(param)
        
        Api.shared.requestToSendOtp(vC, param) { [weak self] responseData in
            guard let self else { return }
            collectionParamDetails()
            print(collectionParamDetails())
            print("The Verification code is: === \(responseData.code ?? "")")
            k.userDefault.set(responseData.code ?? "", forKey: k.session.verificationCode)
            print(k.userDefault.set(responseData.code ?? "", forKey: k.session.verificationCode))
            if shouldNavigate {
                self.cloSuccessfullSendOtp?()
            }
        }
    }
    
    func collectionParamDetails()
    {
        dictSignup["first_name"] = userFirstName as AnyObject
        dictSignup["last_name"] = userLastName as AnyObject
        dictSignup["email"] = userEmail as AnyObject
        dictSignup["password"] = userPassword as AnyObject
        dictSignup["mobile"] = userMobile as AnyObject
        dictSignup["mobile_with_code"] = "\(phoneKey ?? "")\(userMobile)" as AnyObject
        dictSignup["address"] = userAddress as AnyObject
        dictSignup["lat"] = userLat as AnyObject
        dictSignup["lon"] = userLon as AnyObject
        dictSignup["type"] = "DRIVER" as AnyObject
        dictSignup["register_id"] = k.emptyString as AnyObject
        dictSignup["date_time"] = Utility.getCurrentTime() as AnyObject
        dictSignup["ios_register_id"] = k.iosRegisterId as AnyObject
        
        print(dictSignup)
    }
    
//    func requestToRegister(vC: UIViewController) {
//        
//        guard self.isValidInput() else { return }
//        
//        Api.shared.requestToSignup(vC, param) { responseData in
//            let obj = responseData
//            k.userDefault.set(true, forKey: k.session.status)
//            k.userDefault.set(obj.id, forKey: k.session.userId)
//            k.userDefault.set(obj.email, forKey: k.session.userEmail)
//            k.userDefault.set(obj.password, forKey: k.session.userPassword)
//            self.registerSuccessful?()
//        }
//    }
}
