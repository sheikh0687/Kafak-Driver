//
//  OrderDetailViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 01/03/25.
//

import Foundation

class OrderDetailViewModel {
    
    var arrayOfPlaceOrderImage:[Place_OrderImage] = []
    var arrayOfCartDetail: [Cart_details] = []
    
    var orderiD:String = ""
    
    var strUserName:String = ""
    var strUserEmail:String = ""
    var strRequestStatus:String = ""
    var strPaymentStatus:String = ""
    var strRequestDateTime:String = ""
    var strCustomerNote:String = ""
    var strTotalAmount:String = ""
    var strDeliveryCost:String = ""
    var strApplicationFee:String = ""
    var strImgUrl:String = ""
    var strLat:String = ""
    var strLon:String = ""
    var strUserNum:String = ""
    
    var strUserOrderiD:String = ""
    var itmeQty:String = ""
    var strPlaceBidiD:String = ""
    var strPlaceBidAmount:String = ""
    var strPlaceBidStatus:String = ""
    
    var isChatOpen:String = ""
    var isCallOpen:String = ""
    var isDirectAccept:String = ""
    var messageCount:String = ""
    
    var strServiceImg: String = ""
    
    var cloSuccessfull:(() -> Void)?
    
    func requestToFetchOrderDetail(vC: UIViewController) {
        var paramDict: [String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["order_id"] = orderiD as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToOrderDetails(vC, paramDict) { responseData in
            let obj = responseData
            self.strUserName = "\(obj.user_details?.first_name ?? "") \(obj.user_details?.last_name ?? "")"
            self.strUserEmail = obj.user_details?.email ?? ""
            self.strRequestStatus = obj.status ?? ""
            self.strRequestDateTime = obj.date_time ?? ""
            self.strCustomerNote = obj.user_note ?? ""
            self.strTotalAmount = obj.total_amount ?? ""
            self.strDeliveryCost = obj.provider_amount ?? ""
            self.strApplicationFee = obj.admin_commission ?? ""
            self.strImgUrl = obj.user_details?.image ?? ""
            self.strPlaceBidAmount = obj.place_bid_offer_amount ?? ""
            self.strUserOrderiD = obj.user_id ?? ""
            self.itmeQty = obj.cart_details?[0].quantity ?? ""
            self.strPlaceBidStatus = obj.place_bid_status ?? ""
            self.strPaymentStatus = obj.payment_status ?? ""
            self.isDirectAccept = obj.direct_accepted ?? ""
            self.messageCount = obj.message_count ?? ""
            self.strLat = obj.lat ?? ""
            self.strLon = obj.lon ?? ""
            self.strUserNum = obj.user_details?.mobile ?? ""
            
            if let placeOrderImage = obj.place_order_images {
                if placeOrderImage.count > 0 {
                    self.arrayOfPlaceOrderImage = placeOrderImage
                } else {
                    self.arrayOfPlaceOrderImage = []
                }
            }
            
            if let resCartDetail = obj.cart_details {
                if resCartDetail.count > 0 {
                    self.arrayOfCartDetail = resCartDetail
                    let chatStatus = obj.cart_details?[0].product_details?.chat ?? ""
                    let callStatus = obj.cart_details?[0].product_details?.call ?? ""
                    self.isChatOpen = chatStatus
                    self.isCallOpen = callStatus
                    self.strServiceImg = obj.cart_details?[0].product_image ?? ""
                } else {
                    self.arrayOfCartDetail = []
                }
            }
            
            self.cloSuccessfull?()
        }
    }
    
    var cloPlaceBidSuccessfully:(() -> Void)?
    
    func requestToPlaceBid(vC: UIViewController, strAmount: String)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["driver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["order_user_id"] = strUserOrderiD as AnyObject
        paramDict["order_id"] = orderiD as AnyObject
        paramDict["amount"] = strAmount as AnyObject
        paramDict["item_count"] = itmeQty as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToPlaceBid(vC, paramDict) { responseData in
            self.cloPlaceBidSuccessfully?()
        }
    }
    
    var cloUpdatedSucessfully:(() -> Void)?
    
    func requestToUpdatePlaceBid(vC: UIViewController,strAmount:String)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["place_bid_id"] = strPlaceBidiD as AnyObject
        paramDict["amount"] = strAmount as AnyObject
        paramDict["item_count"] = itmeQty as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToUpdatePlaceBid(vC, paramDict) { responseData in
            self.cloUpdatedSucessfully?()
        }
    }
    
    var cloRejectBidSuccessfully:(() -> Void)?
    
    func requestToAddRejectReq(vC: UIViewController)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["driver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["request_id"] = orderiD as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToAddRejectRequest(vC, paramDict) { responseData in
            self.cloRejectBidSuccessfully?()
        }
    }
    
    var cloChangeStatusSuccessfully:(() -> Void)?
    
    func requestToChangeStatus(vC: UIViewController,strStatus:String)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["order_id"] = orderiD as AnyObject
        paramDict["delivery_status"] = strStatus as AnyObject
        paramDict["accept_driver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["status"] = strStatus as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToChangeRequestStatus(vC, paramDict) { responseData in
            self.cloChangeStatusSuccessfully?()
        }
    }
    
    var cloPaymentUpdatedSuccessfully:(() -> Void)?
    
    func requestToUpdatePayment(vC: UIViewController)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["request_id"] = orderiD as AnyObject
        paramDict["payment_status"] = "Complete" as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToUpdatePaymentStatus(vC, paramDict) { responseData in
            self.cloPaymentUpdatedSuccessfully?()
        }
    }
}
