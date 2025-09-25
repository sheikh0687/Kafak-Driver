//
//  ContactUsViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/03/25.
//

import Foundation

class ContactUsViewModel {
    
    var strMessage: String = ""
    var cloSuccessfull: (() -> Void)?
    
    func contactInfo(vC: UIViewController)
    {
        var paramDict:[String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["name"] = k.emptyString as AnyObject
        paramDict["contact_number"] = k.emptyString as AnyObject
        paramDict["email"] = k.emptyString as AnyObject
        paramDict["feedback"] = strMessage as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToSendFeedback(vC, paramDict) { responseData in
            self.cloSuccessfull?()
        }
    }

}
