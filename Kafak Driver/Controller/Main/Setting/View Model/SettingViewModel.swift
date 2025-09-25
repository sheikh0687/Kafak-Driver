//
//  SettingViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/09/24.
//

import Foundation

class SettingViewModel {
    
    var userName:String = ""
    var userImg:String = ""
    var strDriverStatus:String = ""
    var strUserPassword:String = ""
    
    var cloSuccess:(()->Void)?
    
    func getUserDetails(vC: UIViewController) {
        Api.shared.requestToDriverProfile(vC) { [weak self] responseData in
            guard let self = self else { return }
            
            let obj = responseData.result!
            self.userName = obj.first_name ?? ""
            self.userImg = obj.image ?? ""
            self.strDriverStatus = obj.available_status ?? ""
            self.strUserPassword = obj.password ?? ""
            self.cloSuccess?()
        }
    }
    
    var cloSuccessful:(() -> Void)?
    
    func requestToDeleteAccount(vC: UIViewController)
    {
        Api.shared.requestToDeleteAccount(vC) { [weak self] responseData in
            guard let self = self else { return }
            
            if responseData.status == "1" {
                self.cloSuccessful?()
            }
        }
    }
    
    var cloChangeStatus:(() -> Void)?
    
    func requestToChangeStatus(vC: UIViewController, status:String)
    {
        var paramDict:[String:AnyObject] = [:]
        paramDict["driver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["available_status"] = status as AnyObject
        
        Api.shared.requestToChangeDriverStatus(vC, paramDict) { [weak self] responseData in
            guard let self = self else { return }
            self.cloChangeStatus?()
        }
    }
}
