//
//  BankWithdrawRequestViewMode.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 05/04/25.
//

import Foundation
import DropDown

class BankWithdrawRequestViewModel {
    
    var strWithdrawAmount: String = ""
    var strAccountNum:String = ""
    var strAccountHolderName:String = ""
    var strIBANNumber:String = ""
    var strBankName:String = ""
    
    var showErrorMessage:(() -> Void)?
    var cloWithRequestDone: (() -> Void)?
    
    let dropDown = DropDown()
    let accountDropDown = DropDown()
    var strPaymentMethod:String = "Bank Account"
    var strAccountType:String = "Individual"
    
    var errorMessage: String? {
        didSet {
            showErrorMessage?()
        }
    }
    
    func requestToWithdraw(vC: UIViewController) {
        
        guard isValidInput() else { return }
        
        var paramDict: [String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["amount"] = strWithdrawAmount as AnyObject
        paramDict["account_number"] = strAccountNum as AnyObject
        paramDict["account_holder_name"] = strAccountHolderName as AnyObject
        paramDict["IBAN_Number"] = strIBANNumber as AnyObject
        paramDict["bank_name"] = strBankName as AnyObject
        paramDict["account_type"] = strAccountType as AnyObject
        paramDict["method"] = strPaymentMethod as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToWithDrawAmount(vC, paramDict) { responseData in
            self.cloWithRequestDone?()
        }
    }
    
    func isValidInput() -> Bool {
        
        if strPaymentMethod == "Bank Account" {
            if strAccountNum.isEmpty {
                errorMessage = R.string.localizable.pleaseEnterAccountNumber()
                return false
            } else if strAccountHolderName.isEmpty {
                errorMessage = R.string.localizable.pleaseEnterTheAccountHolderName()
                return false
            } else if strIBANNumber.isEmpty {
                errorMessage = R.string.localizable.pleaseEnterTheIBANNumber()
                return false
            } else if strWithdrawAmount.isEmpty {
                errorMessage = R.string.localizable.pleaseEnterAmount()
                return false
            } else if strBankName.isEmpty {
                errorMessage = R.string.localizable.pleaseEnterBankName()
                return false
            }
            
            return true

        } else {
            if strWithdrawAmount.isEmpty {
                errorMessage = R.string.localizable.pleaseEnterAmount()
                return false
            }
            return true
        }
    }
    
    func configureDropDowns(sender: UIButton, bankDetailVw: UIStackView) {
        dropDown.anchorView = sender
        dropDown.dataSource = ["Bank Account", "Cash"]
        dropDown.show()
        dropDown.bottomOffset = CGPoint(x: 0, y: 45)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            sender.setTitle(item, for: .normal)
            self.strPaymentMethod = item
            if index == 0 {
                bankDetailVw.isHidden = false
            } else {
                bankDetailVw.isHidden = true
            }
        }
    }
    
    func configureAccountDropDowns(sender: UIButton) {
        accountDropDown.anchorView = sender
        accountDropDown.dataSource = ["Individual", "Company"]
        accountDropDown.show()
        accountDropDown.bottomOffset = CGPoint(x: 0, y: 45)
        accountDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            sender.setTitle(item, for: .normal)
            self.strAccountType = item
        }
    }
}
