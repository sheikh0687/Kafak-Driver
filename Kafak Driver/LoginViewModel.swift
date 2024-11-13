//
//  LoginViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/09/24.
//

import Foundation

class LoginViewModel {
    
    var userEmail: String = ""
    var userPassword: String = ""
    
    var showErrorMessage:(() -> Void)?
    var loginSuccess:(() -> Void)?
    
    var errorMessage: String? {
        didSet {
            showErrorMessage?()
        }
    }
    
    func navigateToHomeVC(from navigationController: UINavigationController?) {
        Switcher.updateRootVC()
    }
    
    func navigateToSignVC(from navigationController: UINavigationController?) {
        let vC = R.storyboard.main().instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        navigationController?.pushViewController(vC, animated: true)
    }
    
    func navigateToForgetPasswordVC(from navigationController: UINavigationController?) {
        let vC = R.storyboard.main().instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        navigationController?.pushViewController(vC, animated: true)
    }
    
}

extension LoginViewModel {
    
    func isValidInputs() -> Bool {
        if userEmail.isEmpty {
            errorMessage = "Please enter the email address"
            return false
        } else if userPassword.isEmpty {
            errorMessage = "Please enter the password"
            return false
        }
        return true
    }
    
    func requestToLoginUser(vC: UIViewController)
    {
        guard self.isValidInputs() else { return }
        
        var param: [String : AnyObject] = [:]
        param["email"] = userEmail as AnyObject
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
            self.loginSuccess?()
        }
    }
    
}
