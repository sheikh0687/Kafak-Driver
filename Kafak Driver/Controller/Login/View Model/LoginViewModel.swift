//
//  LoginViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/09/24.
//

import Foundation
import DropDown

class LoginViewModel {
    
    var userEmail: String = ""
    var userPassword: String = ""
    var userMobile:String = ""
    var phoneKey:String! = "966"
    
    var showErrorMessage:(() -> Void)?
    var loginSuccess:(() -> Void)?
    var cloUpdateLanguage:(() -> Void)?
    
    let dropDown = DropDown()
    
    var errorMessage: String? {
        didSet {
            showErrorMessage?()
        }
    }
    
    func navigateToHomeVC(from navigationController: UINavigationController?) {
        Switcher.updateRootVC()
    }
    
    func navigateToSignVC(from navigationController: UINavigationController?) {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        navigationController?.pushViewController(vC, animated: true)
    }
    
    func navigateToForgetPasswordVC(from navigationController: UINavigationController?) {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        navigationController?.pushViewController(vC, animated: true)
    }
    
    func configureDropDown(sender: UIButton)
    {
        dropDown.anchorView = sender
        dropDown.show()
        switch L102Language.currentAppleLanguage() {
        case "en":
            dropDown.dataSource = ["English", "Arabic"]
            dropDown.bottomOffset = CGPoint(x: -60, y: 40)
        default:
            dropDown.dataSource = ["الإنجليزية", "العربية"]
            dropDown.bottomOffset = CGPoint(x: 280, y: 40)
        }
        dropDown.selectionAction = { (index: Int, item: String) in
            if index == 0 {
                k.userDefault.set(emLang.en.rawValue, forKey: k.session.language)
                L102Language.setAppleLAnguageTo(lang: "en")
                let _: UIView.AnimationOptions = .transitionFlipFromLeft
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                Switcher.updateRootVC()
            } else if index == 1 {
                k.userDefault.set(emLang.ar.rawValue, forKey: k.session.language)
                L102Language.setAppleLAnguageTo(lang: "ar")
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                Switcher.updateRootVC()
            }
        }
    }
    
    func configureAttributedText(for button: UIButton) {
        let fullText = R.string.localizable.donTHaveAnAccountSignupNow()
        let highlightedText = R.string.localizable.signupNow()

        let attributedString = NSMutableAttributedString(string: fullText)

        // Set default color for the entire text
        attributedString.addAttribute(.foregroundColor, value: UIColor(cgColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), range: NSRange(location: 0, length: fullText.count))

        // Apply highlight attributes to "Login Now"
        let range = (fullText as NSString).range(of: highlightedText)
        attributedString.addAttribute(.foregroundColor, value: R.color.darkBlue()!, range: range)
        attributedString.addAttribute(.font, value: UIFont(name: "Avenir-Heavy", size: 14.0)!, range: range)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        button.setAttributedTitle(attributedString, for: .normal)
    }
}

extension LoginViewModel {
    
    func isValidInputs() -> Bool {
        if userMobile.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterTheMobileNumber()
            return false
        } else if !Utility.isValidMobileNumber(userMobile) {
            errorMessage = L102Language.currentAppleLanguage() == "en" ? "Please enter the valid mobile number" : "الرجاء إدخال رقم جوال صالح"
            return false
        } else if userPassword.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterThePassword()
            return false
        }
        return true
    }
    
    func requestToLoginUser(vC: UIViewController)
    {
        guard self.isValidInputs() else { return }
        
        var param: [String : AnyObject] = [:]
        param["email"] = userEmail as AnyObject
        param["mobile"] = userMobile as AnyObject
        param["mobile_with_code"] = "\(phoneKey ?? "")\(userMobile)" as AnyObject
        param["password"] = userPassword as AnyObject
        param["register_id"] = k.emptyString as AnyObject
        param["ios_register_id"] = k.iosRegisterId as AnyObject
        param["type"] = "DRIVER" as AnyObject
        param["lat"] = k.emptyString as AnyObject
        param["lon"] = k.emptyString as AnyObject
        
        print(param)
        
        Api.shared.requestToLogin(vC, param) { responseData in
            let obj = responseData
            k.userDefault.set(true, forKey: k.session.status)
            k.userDefault.set(obj.id, forKey: k.session.userId)
            k.userDefault.set(obj.email, forKey: k.session.userEmail)
            k.userDefault.set(obj.password, forKey: k.session.userPassword)
            k.userDefault.set(obj.status, forKey: k.session.userAccountStatus)
            self.loginSuccess?()
        }
    }
    
    func updateLanguage(vC: UIViewController, appLan: String)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject
        paramDict["app_language"] = appLan as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToUpdateLanguage(vC, paramDict) { [weak self] responseData in
            guard let self = self else { return }
            self.cloUpdateLanguage?()
        }
    }
}
