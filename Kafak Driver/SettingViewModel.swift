//
//  SettingViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/09/24.
//

import Foundation

class SettingViewModel {
    
    var cloSuccessful:(() -> Void)?
    
    func requestToDeleteAccount(vC: UIViewController)
    {
        Api.shared.requestToDeleteAccount(vC) { responseData in
            if responseData.status == "1" {
                self.cloSuccessful?()
            }
        }
    }
}
