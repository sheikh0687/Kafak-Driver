//
//  VehicleListViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/02/25.
//

import Foundation

class VehicleAndServiceViewModel {
    
    var arrayOfVehicelList: [Res_VehicleList] = []
    var cloSuccessfull: (() -> Void)?
    
    func requestToFetchVehicleList(vC: UIViewController) {
        Api.shared.requestToVehicleList(vC) { responseData in
            if responseData.count > 0 {
                self.arrayOfVehicelList = responseData
            } else {
                self.arrayOfVehicelList = []
            }
            self.cloSuccessfull?()
        }
    }
    
    var cloFethcedSuccessfull:(() -> Void)?
    var arrayOfServiceDetails: [Res_ServiceDetails] = []
    
    var catiD:String = ""
    var serviceiMG:String = ""
    
    func fetchEquipmentDetails(vC: UIViewController) {
        var paramDict: [String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject
        paramDict["cat_id"] = catiD as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToServiceDetails(vC, paramDict) { responseData in
            if responseData.count > 0 {
                self.arrayOfServiceDetails = responseData
            } else {
                self.arrayOfServiceDetails = []
            }
            self.cloFethcedSuccessfull?()
        }
    }
}
