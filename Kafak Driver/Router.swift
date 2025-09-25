//
//  Router.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 20/09/24.
//

import Foundation

enum Router: String {
    
    static let BASE_SERVICE_URL = "https://kaffak.company/kaffak/webservice/"
    static let BASE_IMAGE_URL = "https://kaffak.company/kaffak/uploads/images/"
    
    case login
    case signup
    case send_otp
    
    case forgot_password
    case change_password
    case send_feedback
    
    case get_profile
    case get_provider_category
    case get_services
    case get_all_store_list
    case get_provider_details
    case get_user_address
    case get_product_details
    case get_provider_product
    
    case get_vehicle_list
    case get_driver_order
    case get_service_by_id
    case get_order_details
    case get_notification_list
    case get_user_review_rating
    case get_transaction
    case get_welcome_page_banner
    case get_withdraw_request
    case get_send_feedback
    case get_feedback_chat_detail
    case driver_available_unavailable_status
    
    case get_chat_detail
    case get_conversation_detail
    case insert_chat
    case insert_chat_feedback
    
    case add_user_address
    case add_provider_category
    case add_withdraw_request
    
    case update_provider_category
    case update_driver_profile
    case update_place_bid
    case place_bid
    case change_order_status_by_driver
    case update_payment_status
    
    case delete_user_address
    case delete_account
    case add_rejected_request
    
    case get_user_page
    case add_wallet_amount
    
    case checkout
    case add_rating_review_by_order
    
    case update_app_language
    case send_otp_for_change_password
    case offer_accept_by_user
    
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
        case .send_feedback:
            return Router.oAuthpath(path: "send_feedback")
            
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
        case .get_vehicle_list:
            return Router.oAuthpath(path: "get_vehicle_list")
        case .get_driver_order:
            return Router.oAuthpath(path: "get_driver_order")
        case .get_service_by_id:
            return Router.oAuthpath(path: "get_service_by_id")
        case .get_order_details:
            return Router.oAuthpath(path: "get_order_details")
        case .get_notification_list:
            return Router.oAuthpath(path: "get_notification_list")
        case .get_user_review_rating:
            return Router.oAuthpath(path: "get_user_review_rating")
        case .get_transaction:
            return Router.oAuthpath(path: "get_transaction")
        case .get_welcome_page_banner:
            return Router.oAuthpath(path: "get_welcome_page_banner")
        case .get_withdraw_request:
            return Router.oAuthpath(path: "get_withdraw_request")
            
        case .get_chat_detail:
            return Router.oAuthpath(path: "get_chat_detail")
        case .get_conversation_detail:
            return Router.oAuthpath(path: "get_conversation_detail")
        case .insert_chat:
            return Router.oAuthpath(path: "insert_chat")
            
        case .add_user_address:
            return Router.oAuthpath(path: "add_user_address")
        case .add_provider_category:
            return Router.oAuthpath(path: "add_provider_category")
        case .add_withdraw_request:
            return Router.oAuthpath(path: "add_withdraw_request")
            
        case .update_provider_category:
            return Router.oAuthpath(path: "update_provider_category")
        case .update_driver_profile:
            return Router.oAuthpath(path: "update_driver_profile")
        case .change_order_status_by_driver:
            return Router.oAuthpath(path: "change_order_status_by_driver")
        case .update_payment_status:
            return Router.oAuthpath(path: "update_payment_status")
            
        case .update_place_bid:
            return Router.oAuthpath(path: "update_place_bid")
        case .place_bid:
            return Router.oAuthpath(path: "place_bid")
            
        case .delete_user_address:
            return Router.oAuthpath(path: "delete_user_address")
            
        case .delete_account:
            return Router.oAuthpath(path: "delete_account")
            
        case .add_rejected_request:
            return Router.oAuthpath(path: "add_rejected_request")
        case .driver_available_unavailable_status:
            return Router.oAuthpath(path: "driver_available_unavailable_status")
    
        case .get_send_feedback:
            return Router.oAuthpath(path: "get_send_feedback")
        case .get_feedback_chat_detail:
            return Router.oAuthpath(path: "get_feedback_chat_detail")
        case .insert_chat_feedback:
            return Router.oAuthpath(path: "insert_chat_feedback")
            
        case .get_user_page:
            return Router.oAuthpath(path: "get_user_page")
            
        case .add_wallet_amount:
            return Router.oAuthpath(path: "add_wallet_amount")
        case .checkout:
            return Router.oAuthpath(path: "checkout")
        case .add_rating_review_by_order:
            return Router.oAuthpath(path: "add_rating_review_by_order")
            
        case .update_app_language:
            return Router.oAuthpath(path: "update_app_language")
        case .send_otp:
            return Router.oAuthpath(path: "send_otp")
            
        case .send_otp_for_change_password:
            return Router.oAuthpath(path: "send_otp_for_change_password")
        case .offer_accept_by_user:
            return Router.oAuthpath(path: "offer_accept_by_user")
        }
    }
    
    private static func oAuthpath(path: String) -> String {
        return BASE_SERVICE_URL + path
    }
}
