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
        vC.showProgressBar()
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
                vC.hideProgressBar()
            } catch {
                print(error)
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            vC.hideProgressBar()
        }
    }
    
    func requestToSignup(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_Login) -> Void) {
        vC.showProgressBar()
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
                vC.hideProgressBar()
            } catch {
                print(error)
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            vC.hideProgressBar()
        }
    }
    
    
    func requestToResetPassword(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Api_Basic) -> Void) {
        vC.showProgressBar()
        Service.post(url: Router.forgot_password.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Basic.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                vC.hideProgressBar()
            } catch {
                print(error)
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            vC.hideProgressBar()
        }
    }
    
    func requestToChangePassword(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Api_Basic) -> Void) {
        vC.showProgressBar()
        Service.post(url: Router.change_password.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Basic.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                vC.hideProgressBar()
            } catch {
                print(error)
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            vC.hideProgressBar()
        }
    }

    func requestToDeleteAccount(_ vC: UIViewController,_ success: @escaping(_ responseData: Api_Basic) -> Void) {
        vC.showProgressBar()
        Service.post(url: Router.delete_account.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
            do {
                let jsonDecoder = JSONDecoder()
                let root = try jsonDecoder.decode(Api_Basic.self, from: response)
                if root.result != nil {
                    success(root)
                } else {
                    vC.alert(alertmessage: root.message ?? "")
                }
                vC.hideProgressBar()
            } catch {
                print(error)
            }
        }) { (error: Error) in
            vC.alert(alertmessage: error.localizedDescription)
            vC.hideProgressBar()
        }
    }
    
//    func requestToGetProfileDetail(_ vC: UIViewController,_ success: @escaping(_ responseData: Res_Login) -> Void) {
//        vC.showProgressBar()
//        Service.post(url: Router.get_profile.url(), params: paramGetUserId(), method: .get, vc: vC, successBlock: { (response) in
//            do {
//                let jsonDecoder = JSONDecoder()
//                let root = try jsonDecoder.decode(Api_Login.self, from: response)
//                if root.status == "1" {
//                    if let result = root.result {
//                        success(result)
//                    }
//                } else {
//                    vC.alert(alertmessage: root.message ?? "")
//                }
//                vC.hideProgressBar()
//            } catch {
//                print(error)
//            }
//        }) { (error: Error) in
//            vC.alert(alertmessage: error.localizedDescription)
//            vC.hideProgressBar()
//        }
//    }
//    
//    func requestToGetProviderCat(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: [Res_ProviderCat]) -> Void) {
//        vC.showProgressBar()
//        Service.post(url: Router.get_provider_category.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
//            do {
//                let jsonDecoder = JSONDecoder()
//                let root = try jsonDecoder.decode(Api_ProviderCat.self, from: response)
//                if root.status == "1" {
//                    if let result = root.result {
//                        success(result)
//                    }
//                } else {
//                    vC.alert(alertmessage: root.message ?? "")
//                }
//                vC.hideProgressBar()
//            } catch {
//                print(error)
//            }
//        }) { (error: Error) in
//            vC.alert(alertmessage: error.localizedDescription)
//            vC.hideProgressBar()
//        }
//    }
//    
//    func requestToAddCategory(_ vc: UIViewController, _ params: [String: String], images: [String : UIImage?]?, videos: [String : Data?]?, _ success: @escaping(_ responseData : Res_AddCategory) -> Void) {
//        vc.showProgressBar()
//        Service.postSingleMedia(url: Router.add_provider_category.url(), params: params, imageParam: images, videoParam: videos, parentViewController: vc, successBlock: { (response) in
//            do {
//                let decoder = JSONDecoder()
//                let root = try decoder.decode(Api_AddCategory.self, from: response)
//                if root.status == "1" {
//                    if let result = root.result {
//                        success(result)
//                        vc.hideProgressBar()
//                    }
//                } else {
//                    vc.alert(alertmessage: root.message ?? "Something went wrong")
//                    vc.hideProgressBar()
//                }
//            } catch {
//                vc.hideProgressBar()
//                print(error)
//            }
//            vc.hideProgressBar()
//        }) { (error: Error) in
//            vc.alert(alertmessage: error.localizedDescription)
//            vc.hideProgressBar()
//        }
//    }
//    
//    func requestToUpdateCategory(_ vc: UIViewController, _ params: [String: String], images: [String : UIImage?]?, videos: [String : Data?]?, _ success: @escaping(_ responseData : Res_AddCategory) -> Void) {
//        vc.showProgressBar()
//        Service.postSingleMedia(url: Router.update_provider_category.url(), params: params, imageParam: images, videoParam: videos, parentViewController: vc, successBlock: { (response) in
//            do {
//                let decoder = JSONDecoder()
//                let root = try decoder.decode(Api_AddCategory.self, from: response)
//                if root.status == "1" {
//                    if let result = root.result {
//                        success(result)
//                        vc.hideProgressBar()
//                    }
//                } else {
//                    vc.alert(alertmessage: root.message ?? "Something went wrong")
//                    vc.hideProgressBar()
//                }
//            } catch {
//                vc.hideProgressBar()
//                print(error)
//            }
//            vc.hideProgressBar()
//        }) { (error: Error) in
//            vc.alert(alertmessage: error.localizedDescription)
//            vc.hideProgressBar()
//        }
//    }
//
//    func requestToGetProviderDetails(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_ProviderDt) -> Void) {
//        vC.showProgressBar()
//        Service.post(url: Router.get_provider_details.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
//            do {
//                let jsonDecoder = JSONDecoder()
//                let root = try jsonDecoder.decode(Api_ProviderDetail.self, from: response)
//                if root.status == "1" {
//                    if let result = root.result {
//                        success(result)
//                    }
//                } else {
//                    vC.alert(alertmessage: root.message ?? "")
//                }
//                vC.hideProgressBar()
//            } catch {
//                print(error)
//            }
//        }) { (error: Error) in
//            vC.alert(alertmessage: error.localizedDescription)
//            vC.hideProgressBar()
//        }
//    }
//    
//    func requestToGetProviderProducts(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: [Res_ProviderProducts]) -> Void) {
//        vC.showProgressBar()
//        Service.post(url: Router.get_provider_product.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
//            do {
//                let jsonDecoder = JSONDecoder()
//                let root = try jsonDecoder.decode(Api_ProviderProducts.self, from: response)
//                if root.status == "1" {
//                    if let result = root.result {
//                        success(result)
//                    }
//                } else {
//                    vC.alert(alertmessage: root.message ?? "")
//                }
//                vC.hideProgressBar()
//            } catch {
//                print(error)
//            }
//        }) { (error: Error) in
//            vC.alert(alertmessage: error.localizedDescription)
//            vC.hideProgressBar()
//        }
//    }
//
//    func requestToGetProviderProductDetails(_ vC: UIViewController,_ param: [String : AnyObject],_ success: @escaping(_ responseData: Res_ProviderProductDetails) -> Void) {
//        vC.showProgressBar()
//        Service.post(url: Router.get_product_details.url(), params: param, method: .get, vc: vC, successBlock: { (response) in
//            do {
//                let jsonDecoder = JSONDecoder()
//                let root = try jsonDecoder.decode(Api_ProviderProductDetail.self, from: response)
//                if root.status == "1" {
//                    if let result = root.result {
//                        success(result)
//                    }
//                } else {
//                    vC.alert(alertmessage: root.message ?? "")
//                }
//                vC.hideProgressBar()
//            } catch {
//                print(error)
//            }
//        }) { (error: Error) in
//            vC.alert(alertmessage: error.localizedDescription)
//            vC.hideProgressBar()
//        }
//    }

}
