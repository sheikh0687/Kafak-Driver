//
//  HomeViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 28/02/25.
//

import Foundation

class HomeViewModel {
    
    var arrayOfOrders: [Res_DriverOrders] = []
    var cloSuccessfull:(() -> Void)?
    var strAccountStatus: String = ""
    var strServiceiD: String = ""
    var strServiceImg:String = ""
    
    func requestToFetchOrders(vC: UIViewController, strType: String,_ tableView: UITableView)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["driver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["type"] = strType as AnyObject
        paramDict["lat"] = kAppDelegate.CURRENT_LAT as AnyObject
        paramDict["lon"] = kAppDelegate.CURRENT_LON as AnyObject
        paramDict["token"] = k.emptyString as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToDriverOrders(vC, paramDict) { [weak self] responseData in
            guard let self else { return }
            
            if responseData.status == "1" {
                if let res = responseData.result {
                    if res.count > 0 {
                        self.arrayOfOrders = res
                        tableView.backgroundView = UIView()
                        tableView.reloadData()
                    }
                }
            } else {
                self.arrayOfOrders = []
                tableView.backgroundView = UIView()
                tableView.reloadData()
                if strAccountStatus == "Active" {
                    if strServiceiD != "" {
                        Utility.noDataFound(R.string.localizable.youHaveNoOrders(), k.emptyString, tableViewOt: tableView, parentViewController: vC, appendImg: strServiceImg)
                    } else {
                        Utility.noDataFoundMessage(
                            L102Language.currentAppleLanguage() == "en"
                                ? "Please update your profile details."
                                : L102Language.currentAppleLanguage() == "ar"
                                ? "يرجى تحديث تفاصيل ملفك الشخصي."
                                : "براہِ کرم اپنی پروفائل کی تفصیلات اپ ڈیٹ کریں۔",
                            tableViewOt: tableView
                        )
                    }
                } else {
                    Utility.noDataFoundMessage(
                        L102Language.currentAppleLanguage() == "en"
                        ? "Your account is not active, please contact support or wait for activation. To contact the administrator, go to Settings → Get Help. Profile completion is compulsory, kindly check and complete it if not done."
                        : L102Language.currentAppleLanguage() == "ar"
                        ? "حسابك غير نشط، يرجى الاتصال بالدعم أو الانتظار حتى يتم التفعيل. للتواصل مع المسؤول، انتقل إلى الإعدادات → الحصول على المساعدة. إكمال الملف الشخصي إلزامي، يرجى التحقق وإكماله إذا لم يتم ذلك."
                        : "آپ کا اکاؤنٹ فعال نہیں ہے، براہِ کرم سپورٹ سے رابطہ کریں یا فعال ہونے کا انتظار کریں۔ اگر آپ منتظم سے رابطہ کرنا چاہتے ہیں تو سیٹنگز میں جائیں اور مدد حاصل کریں۔", tableViewOt: tableView)
                }
            }
            self.cloSuccessfull?()
        }
    }
    
    var cloUpdatedSucessfully:(() -> Void)?
    
    func requestToUpdatePlaceBid(vC: UIViewController, strPlaceBidiD: String, strAmount:String, itmeQty:String)
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
    
    var cloPlaceBidSuccessfully:((String) -> Void)?
    
    func requestToPlaceBid(vC: UIViewController, strOrderId: String, strAmount:String, itmeQty:String, strUserOrderiD:String)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["driver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["order_user_id"] = strUserOrderiD as AnyObject
        paramDict["order_id"] = strOrderId as AnyObject
        paramDict["amount"] = strAmount as AnyObject
        paramDict["item_count"] = itmeQty as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToPlaceBid(vC, paramDict) { responseData in
            self.cloPlaceBidSuccessfully?(responseData.id ?? "")
        }
    }
    
    var cloAcceptByUserSuccessfully:(() -> Void)?
    
    func requestToAcceptofferByUser(vC: UIViewController, strOrderiD: String, strAmount: String, itemQty: String, strBidiD: String, strUseriD: String, strPaymentType: String, strPaymentMethod: String) {
        
        var paramDict: [String : AnyObject] = [:]
        paramDict["driver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["user_id"] = strUseriD as AnyObject
        paramDict["bid_id"] = strBidiD as AnyObject
        paramDict["order_id"] = strOrderiD as AnyObject
        paramDict["offer_amount"] = strAmount as AnyObject
        paramDict["total_amount"] = strAmount as AnyObject
        paramDict["payment_type"] = strPaymentType as AnyObject
        paramDict["payment_method"] = strPaymentMethod as AnyObject
        paramDict["quantity"] = itemQty as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToAcceptOfferByUser(vC, paramDict) { [weak self] responseData in
            guard let self else { return }
            
            self.cloAcceptByUserSuccessfully?()
        }
    }
    
    var cloRejectBidSuccessfully:(() -> Void)?
    
    func requestToAddRejectReq(vC: UIViewController, strReqiD: String)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["driver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["request_id"] = strReqiD as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToAddRejectRequest(vC, paramDict) { responseData in
            self.cloRejectBidSuccessfully?()
        }
    }
    
    var userImg:String = ""
    var strDriverStatus:String = ""
    var strMessageCount:String = ""
    var strNotificationCount:String = ""
    var cloSuccess:(()->Void)?
    
    func getDriverDetails(vC: UIViewController) {
        Api.shared.requestToDriverProfile(vC) { [weak self] responseData in
            guard let self else { return }
            
            if responseData.status != "1" {
                Switcher.updateRootVC()
            }
            
            let obj = responseData.result!
            self.userImg = obj.image ?? ""
            self.strDriverStatus = obj.available_status ?? ""
            self.strMessageCount = obj.message_count ?? ""
            self.strNotificationCount = obj.noti_count ?? ""
            self.strAccountStatus = obj.status ?? ""
            self.strServiceiD = obj.service_id ?? ""
            self.strServiceImg = obj.sub_service_image ?? ""
            self.cloSuccess?()
        }
    }
    
    var cloChangeStatus:(() -> Void)?
    
    func requestToChangeStatus(vC: UIViewController, status:String)
    {
        var paramDict:[String:AnyObject] = [:]
        paramDict["driver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["available_status"] = status as AnyObject
        
        Api.shared.requestToChangeDriverStatus(vC, paramDict) { responseData in
            self.cloChangeStatus?()
        }
    }
}
