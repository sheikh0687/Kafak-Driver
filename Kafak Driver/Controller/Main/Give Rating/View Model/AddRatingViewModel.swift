//
//  AddRatingViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 11/03/25.
//

import Foundation

class AddRatingViewModel {
    
    var useriD: String = ""
    var req_Id: String = ""
    var ratingStar:Double = 0.0
    var strReview:String = ""
    var cloRateSuccess: (() -> Void)?
    
    func requestToAddRatings(vC: UIViewController)
    {
        var paramDict: [String : String] = [:]
        paramDict["from_id"]                = k.userDefault.value(forKey: k.session.userId) as? String
        paramDict["to_id"]                  = self.useriD
        paramDict["request_id"]             = self.req_Id
        paramDict["rating"]                 = String(ratingStar)
        paramDict["review"]                 = strReview
    
        print(paramDict)
        
        Api.shared.requestToAddRatingReview(vC, paramDict, images: [:], videos: [:]) { responseData in
            if responseData.status == "1" {
                self.cloRateSuccess?()
            }
        }
    }
    
    var cloPaymentUpdatedSuccessfully:((String) -> Void)?
    
    func requestToUpdatePayment(vC: UIViewController)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["request_id"] = req_Id as AnyObject
        paramDict["payment_status_by_user"] = "Complete" as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToUpdatePaymentStatus(vC, paramDict) { responseData in
            self.cloPaymentUpdatedSuccessfully?(responseData.message ?? "")
        }
    }
}
