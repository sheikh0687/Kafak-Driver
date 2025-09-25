//
//  ForgotPasswordViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 20/09/24.
//

import Foundation

class ForgotPasswordViewModel {
    
    var userEmail: String = ""
    
    var showErrorMessage:(() -> Void)?
    var passwordResetSuccess:(() -> Void)?
    
    var errorMessage: String? {
        didSet {
            self.showErrorMessage?()
        }
    }
    
    func isValidInputs() -> Bool {
        if userEmail.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterTheEmailAddress()
            return false
        }
        return true
    }
    
    func requestToResetPassword(vC: UIViewController)
    {
        guard isValidInputs() else { return }
        
        var param: [String : AnyObject] = [:]
        param["email"] = userEmail as AnyObject
        
        print(param)
        
        Api.shared.requestToResetPassword(vC, param) { responseData in
            if responseData.status == "1" {
                self.passwordResetSuccess?()
            } else {
                Utility.showAlertMessage(withTitle: k.appName, message: responseData.message ?? "", delegate: nil, parentViewController: vC)
            }
        }
    }
}
