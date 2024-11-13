//
//  Router.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 20/09/24.
//

import Foundation

enum Router: String {
    
    static let BASE_SERVICE_URL = "https://techimmense.in/kafak/webservice/"
    static let BASE_IMAGE_URL = "https://techimmense.in/kafak/uploads/images/"
    
    case login
    case signup
    
    case forgot_password
    case change_password
    
    case get_profile
    case get_provider_category
    case get_services
    case get_all_store_list
    case get_provider_details
    case get_user_address
    case get_product_details
    case get_provider_product
    
    case add_user_address
    case add_provider_category
    
    case update_provider_category
    
    case delete_user_address
    case delete_account
    
    public func url() -> String {
        switch self {
            
        case .login:
            return Router.oAuthpath(path: "login")
        case .signup:
            return Router.oAuthpath(path: "signup")
            
        case .forgot_password:
            return Router.oAuthpath(path: "forgot_password")
        case .change_password:
            return Router.oAuthpath(path: "change_password")
            
        case .get_profile:
            return Router.oAuthpath(path: "get_profile")
        case .get_provider_category:
            return Router.oAuthpath(path: "get_provider_category")
        case .get_services:
            return Router.oAuthpath(path: "get_services")
        case .get_all_store_list:
            return Router.oAuthpath(path: "get_all_store_list")
        case .get_provider_details:
            return Router.oAuthpath(path: "get_provider_details")
        case .get_user_address:
            return Router.oAuthpath(path: "get_user_address")
        case .get_product_details:
            return Router.oAuthpath(path: "get_product_details")
        case .get_provider_product:
            return Router.oAuthpath(path: "get_provider_product")
            
        case .add_user_address:
            return Router.oAuthpath(path: "add_user_address")
        case .add_provider_category:
            return Router.oAuthpath(path: "add_provider_category")
        case .update_provider_category:
            return Router.oAuthpath(path: "update_provider_category")
            
        case .delete_user_address:
            return Router.oAuthpath(path: "delete_user_address")
       
        case .delete_account:
            return Router.oAuthpath(path: "delete_account")
        }
    }
    
    private static func oAuthpath(path: String) -> String {
        return BASE_SERVICE_URL + path
    }
}
