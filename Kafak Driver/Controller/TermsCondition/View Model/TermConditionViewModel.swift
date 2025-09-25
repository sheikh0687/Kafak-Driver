//
//  TermConditionViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 21/04/25.
//

import Foundation

class TermConditionViewModel {
    
    var strType:String = ""
    var strDescription:String = ""
    
    var cloSuccess: (() -> Void)?
    
    func fetchUserPages(vC: UIViewController)
    {
        Api.shared.requestToTermsCondition(vC) { [self] responseData in
            let obj = responseData
            if self.strType == "TermsCondition" {
                if L102Language.currentAppleLanguage() == "ar" {
                    self.strDescription = obj.term_sp ?? ""
                } else if L102Language.currentAppleLanguage() == "en" {
                    self.strDescription = obj.term ?? ""
                } else {
                    self.strDescription = obj.term_ur ?? ""
                }
            } else {
                if L102Language.currentAppleLanguage() == "ar" {
                    self.strDescription = obj.privacy_sp ?? ""
                } else if L102Language.currentAppleLanguage() == "en" {
                    self.strDescription = obj.privacy ?? ""
                } else {
                    self.strDescription = obj.privacy_ur ?? ""
                }
            }
            self.cloSuccess?()
        }
    }
}
