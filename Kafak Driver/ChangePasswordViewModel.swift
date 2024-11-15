//
//  ChangePasswordViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/09/24.
//

import Foundation

class ChangePasswordViewModel {
    
    var oldPassword:String = ""
    var newPassword:String = ""
    var confirmPassword: String = ""
    
    var cloSuccessfull:(() -> Void)?
    var showErrorMessage:(() -> Void)?
    
    var errorMessage: String? {
        didSet {
            self.showErrorMessage?()
        }
    }
    
    func isValidInputs() -> Bool {
        if oldPassword.isEmpty {
            errorMessage = "Please enter the correct password"
            return false
        } else if newPassword.isEmpty {
            errorMessage = "Please enter the new password"
            return false
        } else if confirmPassword.isEmpty {
            errorMessage = "Please confirm the passwords"
            return false
        } else if newPassword != confirmPassword {
            errorMessage = "Password mismatched, please enter the same password"
            return false
        }
        return true
    }
    
    
    func requestToChangePassword(vC: UIViewController)
    {
        guard isValidInputs() else { return }
        
        var paramDict: [String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["old_password"] = oldPassword as AnyObject
        paramDict["password"] = newPassword as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToChangePassword(vC, paramDict) { responseData in
            if responseData.status == "1" {
                self.cloSuccessfull?()
            } else {
                print("Something went wrong")
            }
        }
    }
    
}
