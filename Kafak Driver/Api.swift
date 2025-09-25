//
//  Api.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 20/09/24.
//

import Foundation
import UIKit

class Api: NSObject {
    
    static let shared = Api()
    private override init() {}
    
    func paramGetUserId() -> [String : AnyObject]
    {
        var dict: [String : AnyObject] = [:]
        dict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject
        return dict
    }
    
    func requestToLogin(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_Login) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.login.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Login.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                    k.userDefault.set(false, forKey: k.session.status)
                    k.userDefault.set(k.emptyString, forKey: k.session.userId)
                    k.userDefault.set(k.emptyString, forKey: k.session.userEmail)
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToSignup(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_Login) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.signup.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Login.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                    k.userDefault.set(false, forKey: k.session.status)
                    k.userDefault.set(k.emptyString, forKey: k.session.userId)
                    k.userDefault.set(k.emptyString, forKey: k.session.userEmail)
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToSendOtp(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_SendOtp) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.send_otp.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_SendOtp.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToSendOtpForResetPassword(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_SendOtp) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.send_otp_for_change_password.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_SendOtp.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToDriverProfile(_ vC: UIViewController,_ success: @escaping(_ responseData: Api_Profile) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_profile.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Profile.self, from: response)
                if root.status == "1" {
                    success(root)
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToUpdateDriverProfile(_ vc: UIViewController, _ params: [String: String], images: [String : UIImage?]?, videos: [String : Data?]?, _ success: @escaping(_ responseData : Res_Profile) -> Void) {
        CustomLoader.showCustomLoader()
        Service.postSingleMedia(url: Router.update_driver_profile.url(), params: params, imageParam: images, videoParam: videos, parentViewController: vc, successBlock: { (responseData) in
            do {
                let decoder = JSONDecoder()
                let root = try decoder.decode(Api_Profile.self, from: responseData)
                if root.status == "1" {
                    vc.hideProgressBar()
                    if let result = root.result {
                        success(result)
                    }
                }
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
            CustomLoader.hideCustomLoader()
        }) { (error: Error) in
            vc.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToResetPassword(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Api_Basic) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.forgot_password.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Basic.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToChangePassword(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Api_Basic) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.change_password.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Basic.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToDeleteAccount(_ vC: UIViewController,_ success: @escaping(_ responseData: Api_Basic) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.delete_account.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Basic.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToAllService(_ vC: UIViewController,_ success: @escaping(_ responseData: [Res_Services]) -> Void) {
        //        vC.showProgressBar()
        Service.post(url: Router.get_services.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Service.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                        vC.hideProgressBar()
                    }
                } else {
                    print(root.message ?? "")
                }
                vC.hideProgressBar()
            } catch {
                print(error)
                vC.hideProgressBar()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            vC.hideProgressBar()
        }
    }
    
    func requestToVehicleList(_ vC: UIViewController,_ success: @escaping(_ responseData: [Res_VehicleList]) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_vehicle_list.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_VehicleList.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToDriverOrders(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Api_DriverOrders) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_driver_order.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_DriverOrders.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToServiceDetails(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: [Res_ServiceDetails]) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_service_by_id.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_ServiceDetails.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToUpdatePlaceBid(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_UpdatePlacebid) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.update_place_bid.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_UpdatePlacebid.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToPlaceBid(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_UpdatePlacebid) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.place_bid.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_UpdatePlacebid.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToAcceptOfferByUser(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_OfferAcceptedByUser) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.offer_accept_by_user.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_OfferAcceptedByUser.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToOrderDetails(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_DriverOrderDetails) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_order_details.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_DriverOrderDetails.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToAddRejectRequest(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_RejectBid) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.add_rejected_request.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_RejectBid.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToChangeRequestStatus(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_ChangeRequestStatus) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.change_order_status_by_driver.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_ChangeRequestStatus.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToNotification(_ vC: UIViewController,_ success: @escaping(_ responseData: Api_Notification) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_notification_list.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Notification.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToUpdatePaymentStatus(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Api_Basic) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.update_payment_status.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Basic.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToUserChatDetails(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: [Res_ChatDetails]) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_chat_detail.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_ChatDetails.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToLastConversation(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Api_LastChat) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_conversation_detail.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_LastChat.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToSendChat(_ vc: UIViewController, _ params: [String: String], images: [String : UIImage?]?,videos: [String : Data?]?, _ success: @escaping(_ responseData : ResSendChat) -> Void) {
        CustomLoader.showCustomLoader()
        Service.postSingleMedia(url: Router.insert_chat.url(), params: params, imageParam: images, videoParam: videos, parentViewController: vc, successBlock:  { (response) in
            do {
                let decoder = JSONDecoder()
                let root = try decoder.decode(ApiSendChat.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    vc.alert(alertmessage: root.message ?? "Something went wrong")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vc.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }

    func requestToFetchUserReview(_ vC: UIViewController,_ success: @escaping(_ responseData: [Res_ReviewList]) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_user_review_rating.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_ReviewList.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToFetchWalletTransaction(_ vC: UIViewController,param: [String : AnyObject],_ success: @escaping(_ responseData: Api_TransactionHistory) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_transaction.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_TransactionHistory.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToWithDrawAmount(_ vc: UIViewController, _ params: [String: AnyObject], _ success: @escaping(_ responseData : Res_BankWithdrawRequest) -> Void) {
        vc.showProgressBar()
        Service.post(url: Router.add_withdraw_request.url(), params: params, method: .get, vc: vc, successBlock: { (response) in
            do {
                let decoder = JSONDecoder()
                let root = try decoder.decode(Api_BankWithdrawRequest.self, from: response)
                if let result = root.result {
                    success(result)
                    vc.hideProgressBar()
                }
            } catch {
                print(error)
                vc.hideProgressBar()
            }
            vc.hideProgressBar()
        }) { (error: Error) in
            vc.alert(alertmessage: error.localizedDescription)
            vc.hideProgressBar()
        }
    }

    func requestToAddWalletAmount(_ vC: UIViewController,_ paramDict: [String : AnyObject],_ success: @escaping(_ responseData: Res_AddWalletAmount) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.add_wallet_amount.url(), params: paramDict, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_AddWalletAmount.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToSendFeedback(_ vc: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_Contact) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.send_feedback.url(), params: param, method: .get, vc: vc, successBlock: {(response) in
            do {
                let decoder = JSONDecoder()
                let root = try decoder.decode(Api_ContactInfo.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    vc.alert(alertmessage: root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vc.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToChangeDriverStatus(_ vc: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_DriverStatus) -> Void) {
        Service.post(url: Router.driver_available_unavailable_status.url(), params: param, method: .get, vc: vc, successBlock: {(response) in
            do {
                let decoder = JSONDecoder()
                let root = try decoder.decode(Api_DriverStatus.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    vc.alert(alertmessage: root.message ?? "")
                }
            } catch {
                print(error)
            }
        }) { (error: Error) in
            vc.alert(alertmessage: error.localizedDescription)
        }
    }
    
    func requestToWelcomeBanner(_ vC: UIViewController,_ success: @escaping(_ responseData: [Res_OnBoarding]) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_welcome_page_banner.url(), params: ["type" : "DRIVER"] as? [String : AnyObject], method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_OnBoarding.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToCheckWithrawAmountReq(_ vC: UIViewController,_ success: @escaping(_ responseData: Api_WithdrawAmountRequest) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_withdraw_request.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_WithdrawAmountRequest.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }

    func requestToAdminChat(_ vC: UIViewController,_ success: @escaping(_ responseData: [Res_AdminChat]) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_send_feedback.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_AdminChat.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }

    func requestToAdminChatDetails(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: [Res_AdminConversation]) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_feedback_chat_detail.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_AdminConversation.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToSendAdminChat(_ vc: UIViewController, _ params: [String: String], images: [String : UIImage?]?,videos: [String : Data?]?, _ success: @escaping(_ responseData : ResSendChat) -> Void) {
        CustomLoader.showCustomLoader()
        Service.postSingleMedia(url: Router.insert_chat_feedback.url(), params: params, imageParam: images, videoParam: videos, parentViewController: vc, successBlock:  { (response) in
            do {
                let decoder = JSONDecoder()
                let root = try decoder.decode(ApiSendChat.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    vc.alert(alertmessage: root.message ?? "Something went wrong")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vc.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToTermsCondition(_ vC: UIViewController,_ success: @escaping(_ responseData: Res_TermCondition) -> Void) {
        CustomLoader.showCustomLoader()
        Service.post(url: Router.get_user_page.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_TermsCondition.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToAddRatingReview(_ vc: UIViewController, _ params: [String: String], images: [String : UIImage?]?, videos: [String : Data?]?, _ success: @escaping(_ responseData : Api_Basic) -> Void) {
        CustomLoader.showCustomLoader()
        Service.postSingleMedia(url: Router.add_rating_review_by_order.url(), params: params, imageParam: images, videoParam: videos, parentViewController: vc, successBlock: { (response) in
            do {
                let decoder = JSONDecoder()
                let root = try decoder.decode(Api_Basic.self, from: response)
                if root.status != "0" {
                    success(root)
                } else {
                    Utility.showAlertWithAction(withTitle: k.appName, message: root.message ?? "", delegate: nil, parentViewController: vc) { bool in
                        Switcher.updateRootVC()
                    }
                }
            } catch {
                print(error)
                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vc.alert(alertmessage: error.localizedDescription)
            CustomLoader.hideCustomLoader()
        }
    }
    
    func requestToUpdateLanguage(_ vC: UIViewController,_ paramDict: [String : AnyObject],_ success: @escaping(_ responseData: Res_UpdateLanguage) -> Void) {
//        CustomLoader.showCustomLoader()
        Service.post(url: Router.update_app_language.url(), params: paramDict, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_UpdateLanguge.self, from: response)
                if root.status == "1" {
                    if let result = root.result {
                        success(result)
                    }
                } else {
                    print(root.message ?? "")
                }
//                CustomLoader.hideCustomLoader()
            } catch {
                print(error)
//                CustomLoader.hideCustomLoader()
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
//            CustomLoader.hideCustomLoader()
        }
    }
}
