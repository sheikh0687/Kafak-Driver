//
//  OrderDetails.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 01/03/25.
//

import Foundation

struct Api_DriverOrderDetails : Codable {
    let result : Res_DriverOrderDetails?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Res_DriverOrderDetails.self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_DriverOrderDetails : Codable {
    let id : String?
    let user_id : String?
    let provider_id : String?
    let product_id : String?
    let cart_id : String?
    let cat_id : String?
    let size_id : String?
    let vehicle_id : String?
    let address_id : String?
    let address : String?
    let lat : String?
    let lon : String?
    let order_id : String?
    let price_type : String?
    let total_amount : String?
    let before_discount_amount : String?
    let total_discount_amount : String?
    let payment_type : String?
    let provider_amount : String?
    let admin_commission : String?
    let driver_amount : String?
    let delivery_date : String?
    let delivery_time : String?
    let date_time : String?
    let status : String?
    let self_delivery_status : String?
    let delivery_status : String?
    let payment_status : String?
    let payment_method : String?
    let driver_id : String?
    let accept_driver_id : String?
    let driver_offer_amount : String?
    let bid_id : String?
    let remove_status : String?
    let delivery_fee : String?
    let order_pin : String?
    let pickup_address : String?
    let pickup_lat : String?
    let pickup_lon : String?
    let provider_note : String?
    let date : String?
    let time : String?
    let offer_id : String?
    let offer_code : String?
    let reason_title : String?
    let reason_detail : String?
    let order_type : String?
    let direct_accepted : String?
    let zone_id : String?
    let zone_price : String?
    let zone_name : String?
    let zone_price_id : String?
    let user_note : String?
    let cancel_by_user : String?
    let cancel_reason : String?
    let place_bid_offer_amount : String?
    let place_bid_status : String?
    let message_count : String?
    let rating_review : String?
    let rating_review_driver : String?
    let cart_details : [Cart_details]?
//    let address_details : Address_details?
    let distance : String?
//    let provider_details : Provider_details?
    let driver_details : Driver_details?
    let user_details : User_details?
    let place_order_images : [Place_OrderImage]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case provider_id = "provider_id"
        case product_id = "product_id"
        case cart_id = "cart_id"
        case cat_id = "cat_id"
        case size_id = "size_id"
        case vehicle_id = "vehicle_id"
        case address_id = "address_id"
        case address = "address"
        case lat = "lat"
        case lon = "lon"
        case order_id = "order_id"
        case price_type = "price_type"
        case total_amount = "total_amount"
        case before_discount_amount = "before_discount_amount"
        case total_discount_amount = "total_discount_amount"
        case payment_type = "payment_type"
        case provider_amount = "provider_amount"
        case admin_commission = "admin_commission"
        case driver_amount = "driver_amount"
        case delivery_date = "delivery_date"
        case delivery_time = "delivery_time"
        case date_time = "date_time"
        case status = "status"
        case self_delivery_status = "self_delivery_status"
        case delivery_status = "delivery_status"
        case payment_status = "payment_status"
        case payment_method = "payment_method"
        case driver_id = "driver_id"
        case accept_driver_id = "accept_driver_id"
        case driver_offer_amount = "driver_offer_amount"
        case bid_id = "bid_id"
        case remove_status = "remove_status"
        case delivery_fee = "delivery_fee"
        case order_pin = "order_pin"
        case pickup_address = "pickup_address"
        case pickup_lat = "pickup_lat"
        case pickup_lon = "pickup_lon"
        case provider_note = "provider_note"
        case date = "date"
        case time = "time"
        case offer_id = "offer_id"
        case offer_code = "offer_code"
        case reason_title = "reason_title"
        case reason_detail = "reason_detail"
        case order_type = "order_type"
        case direct_accepted = "direct_accepted"
        case zone_id = "zone_id"
        case zone_price = "zone_price"
        case zone_name = "zone_name"
        case zone_price_id = "zone_price_id"
        case user_note = "user_note"
        case cancel_by_user = "cancel_by_user"
        case cancel_reason = "cancel_reason"
        case place_bid_offer_amount = "place_bid_offer_amount"
        case place_bid_status = "place_bid_status"
        case message_count = "message_count"
        case rating_review = "rating_review"
        case rating_review_driver = "rating_review_driver"
        case cart_details = "cart_details"
//        case address_details = "address_details"
        case distance = "distance"
//        case provider_details = "provider_details"
        case driver_details = "driver_details"
        case user_details = "user_details"
        case place_order_images = "place_order_images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
        cart_id = try values.decodeIfPresent(String.self, forKey: .cart_id)
        cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
        size_id = try values.decodeIfPresent(String.self, forKey: .size_id)
        vehicle_id = try values.decodeIfPresent(String.self, forKey: .vehicle_id)
        address_id = try values.decodeIfPresent(String.self, forKey: .address_id)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lon = try values.decodeIfPresent(String.self, forKey: .lon)
        order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
        price_type = try values.decodeIfPresent(String.self, forKey: .price_type)
        total_amount = try values.decodeIfPresent(String.self, forKey: .total_amount)
        before_discount_amount = try values.decodeIfPresent(String.self, forKey: .before_discount_amount)
        total_discount_amount = try values.decodeIfPresent(String.self, forKey: .total_discount_amount)
        payment_type = try values.decodeIfPresent(String.self, forKey: .payment_type)
        provider_amount = try values.decodeIfPresent(String.self, forKey: .provider_amount)
        admin_commission = try values.decodeIfPresent(String.self, forKey: .admin_commission)
        driver_amount = try values.decodeIfPresent(String.self, forKey: .driver_amount)
        delivery_date = try values.decodeIfPresent(String.self, forKey: .delivery_date)
        delivery_time = try values.decodeIfPresent(String.self, forKey: .delivery_time)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        self_delivery_status = try values.decodeIfPresent(String.self, forKey: .self_delivery_status)
        delivery_status = try values.decodeIfPresent(String.self, forKey: .delivery_status)
        payment_status = try values.decodeIfPresent(String.self, forKey: .payment_status)
        payment_method = try values.decodeIfPresent(String.self, forKey: .payment_method)
        driver_id = try values.decodeIfPresent(String.self, forKey: .driver_id)
        accept_driver_id = try values.decodeIfPresent(String.self, forKey: .accept_driver_id)
        driver_offer_amount = try values.decodeIfPresent(String.self, forKey: .driver_offer_amount)
        bid_id = try values.decodeIfPresent(String.self, forKey: .bid_id)
        remove_status = try values.decodeIfPresent(String.self, forKey: .remove_status)
        delivery_fee = try values.decodeIfPresent(String.self, forKey: .delivery_fee)
        order_pin = try values.decodeIfPresent(String.self, forKey: .order_pin)
        pickup_address = try values.decodeIfPresent(String.self, forKey: .pickup_address)
        pickup_lat = try values.decodeIfPresent(String.self, forKey: .pickup_lat)
        pickup_lon = try values.decodeIfPresent(String.self, forKey: .pickup_lon)
        provider_note = try values.decodeIfPresent(String.self, forKey: .provider_note)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        time = try values.decodeIfPresent(String.self, forKey: .time)
        offer_id = try values.decodeIfPresent(String.self, forKey: .offer_id)
        offer_code = try values.decodeIfPresent(String.self, forKey: .offer_code)
        reason_title = try values.decodeIfPresent(String.self, forKey: .reason_title)
        reason_detail = try values.decodeIfPresent(String.self, forKey: .reason_detail)
        order_type = try values.decodeIfPresent(String.self, forKey: .order_type)
        direct_accepted = try values.decodeIfPresent(String.self, forKey: .direct_accepted)
        zone_id = try values.decodeIfPresent(String.self, forKey: .zone_id)
        zone_price = try values.decodeIfPresent(String.self, forKey: .zone_price)
        zone_name = try values.decodeIfPresent(String.self, forKey: .zone_name)
        zone_price_id = try values.decodeIfPresent(String.self, forKey: .zone_price_id)
        user_note = try values.decodeIfPresent(String.self, forKey: .user_note)
        cancel_by_user = try values.decodeIfPresent(String.self, forKey: .cancel_by_user)
        cancel_reason = try values.decodeIfPresent(String.self, forKey: .cancel_reason)
        place_bid_offer_amount = try values.decodeIfPresent(String.self, forKey: .place_bid_offer_amount)
        place_bid_status = try values.decodeIfPresent(String.self, forKey: .place_bid_status)
        message_count = try values.decodeIfPresent(String.self, forKey: .message_count)
        rating_review = try values.decodeIfPresent(String.self, forKey: .rating_review)
        rating_review_driver = try values.decodeIfPresent(String.self, forKey: .rating_review_driver)
        cart_details = try values.decodeIfPresent([Cart_details].self, forKey: .cart_details)
//        address_details = try values.decodeIfPresent(Address_details.self, forKey: .address_details)
        distance = try values.decodeIfPresent(String.self, forKey: .distance)
//        provider_details = try values.decodeIfPresent(Provider_details.self, forKey: .provider_details)
        driver_details = try values.decodeIfPresent(Driver_details.self, forKey: .driver_details)
        user_details = try values.decodeIfPresent(User_details.self, forKey: .user_details)
        place_order_images = try values.decodeIfPresent([Place_OrderImage].self, forKey: .place_order_images)
    }
}

struct Driver_details : Codable {
    let id : String?
    let first_name : String?
    let last_name : String?
    let mobile : String?
    let mobile_with_code : String?
    let email : String?
    let password : String?
    let country_id : String?
    let country_name : String?
    let state_id : String?
    let state_name : String?
    let city_id : String?
    let city_name : String?
    let image : String?
    let type : String?
    let role : String?
    let social_id : String?
    let lat : String?
    let lon : String?
    let address : String?
    let address_id : String?
    let addresstype : String?
    let gender : String?
    let wallet : String?
    let register_id : String?
    let ios_register_id : String?
    let status : String?
    let approve_status : String?
    let available_status : String?
    let code : String?
    let date_time : String?
    let note : String?
    let note_block : String?
    let block_unblock : String?
    let remove_status : String?
    let open_time : String?
    let close_time : String?
    let referral_code : String?
    let signup_referral_code : String?
    let provider_name : String?
    let provider_email : String?
    let provider_mobile : String?
    let provider_streat_address : String?
    let provider_lat : String?
    let provider_lon : String?
    let provider_post_code : String?
    let provider_country : String?
    let provider_country_id : String?
    let facebook_url : String?
    let instagram_url : String?
    let description : String?
    let about_me : String?
    let provider_logo : String?
    let radius : String?
    let cat_id : String?
    let cat_name : String?
    let cat_name_ar : String?
    let driver_choice : String?
    let direct_accepted : String?
    let vehicle_name : String?
    let vehicle_id : String?
    let vehicle_type : String?
    let driver_experience : String?
    let vehicle_delivery_type : String?
    let service_id : String?
    let service_name : String?
    let sub_service_id : String?
    let sub_service_name : String?
    let registration_image : String?
    let supervisor_name : String?
    let supervisor_number : String?
    let front_view : String?
    let rear_view : String?
    let side_view : String?
    let registered_type : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
        case mobile = "mobile"
        case mobile_with_code = "mobile_with_code"
        case email = "email"
        case password = "password"
        case country_id = "country_id"
        case country_name = "country_name"
        case state_id = "state_id"
        case state_name = "state_name"
        case city_id = "city_id"
        case city_name = "city_name"
        case image = "image"
        case type = "type"
        case role = "role"
        case social_id = "social_id"
        case lat = "lat"
        case lon = "lon"
        case address = "address"
        case address_id = "address_id"
        case addresstype = "addresstype"
        case gender = "gender"
        case wallet = "wallet"
        case register_id = "register_id"
        case ios_register_id = "ios_register_id"
        case status = "status"
        case approve_status = "approve_status"
        case available_status = "available_status"
        case code = "code"
        case date_time = "date_time"
        case note = "note"
        case note_block = "note_block"
        case block_unblock = "block_unblock"
        case remove_status = "remove_status"
        case open_time = "open_time"
        case close_time = "close_time"
        case referral_code = "referral_code"
        case signup_referral_code = "signup_referral_code"
        case provider_name = "provider_name"
        case provider_email = "provider_email"
        case provider_mobile = "provider_mobile"
        case provider_streat_address = "provider_streat_address"
        case provider_lat = "provider_lat"
        case provider_lon = "provider_lon"
        case provider_post_code = "provider_post_code"
        case provider_country = "provider_country"
        case provider_country_id = "provider_country_id"
        case facebook_url = "facebook_url"
        case instagram_url = "instagram_url"
        case description = "description"
        case about_me = "about_me"
        case provider_logo = "provider_logo"
        case radius = "radius"
        case cat_id = "cat_id"
        case cat_name = "cat_name"
        case cat_name_ar = "cat_name_ar"
        case driver_choice = "driver_choice"
        case direct_accepted = "direct_accepted"
        case vehicle_name = "vehicle_name"
        case vehicle_id = "vehicle_id"
        case vehicle_type = "vehicle_type"
        case driver_experience = "driver_experience"
        case vehicle_delivery_type = "vehicle_delivery_type"
        case service_id = "service_id"
        case service_name = "service_name"
        case sub_service_id = "sub_service_id"
        case sub_service_name = "sub_service_name"
        case registration_image = "registration_image"
        case supervisor_name = "supervisor_name"
        case supervisor_number = "supervisor_number"
        case front_view = "front_view"
        case rear_view = "rear_view"
        case side_view = "side_view"
        case registered_type = "registered_type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        mobile_with_code = try values.decodeIfPresent(String.self, forKey: .mobile_with_code)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        country_id = try values.decodeIfPresent(String.self, forKey: .country_id)
        country_name = try values.decodeIfPresent(String.self, forKey: .country_name)
        state_id = try values.decodeIfPresent(String.self, forKey: .state_id)
        state_name = try values.decodeIfPresent(String.self, forKey: .state_name)
        city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
        city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        social_id = try values.decodeIfPresent(String.self, forKey: .social_id)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lon = try values.decodeIfPresent(String.self, forKey: .lon)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        address_id = try values.decodeIfPresent(String.self, forKey: .address_id)
        addresstype = try values.decodeIfPresent(String.self, forKey: .addresstype)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        wallet = try values.decodeIfPresent(String.self, forKey: .wallet)
        register_id = try values.decodeIfPresent(String.self, forKey: .register_id)
        ios_register_id = try values.decodeIfPresent(String.self, forKey: .ios_register_id)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        approve_status = try values.decodeIfPresent(String.self, forKey: .approve_status)
        available_status = try values.decodeIfPresent(String.self, forKey: .available_status)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        note = try values.decodeIfPresent(String.self, forKey: .note)
        note_block = try values.decodeIfPresent(String.self, forKey: .note_block)
        block_unblock = try values.decodeIfPresent(String.self, forKey: .block_unblock)
        remove_status = try values.decodeIfPresent(String.self, forKey: .remove_status)
        open_time = try values.decodeIfPresent(String.self, forKey: .open_time)
        close_time = try values.decodeIfPresent(String.self, forKey: .close_time)
        referral_code = try values.decodeIfPresent(String.self, forKey: .referral_code)
        signup_referral_code = try values.decodeIfPresent(String.self, forKey: .signup_referral_code)
        provider_name = try values.decodeIfPresent(String.self, forKey: .provider_name)
        provider_email = try values.decodeIfPresent(String.self, forKey: .provider_email)
        provider_mobile = try values.decodeIfPresent(String.self, forKey: .provider_mobile)
        provider_streat_address = try values.decodeIfPresent(String.self, forKey: .provider_streat_address)
        provider_lat = try values.decodeIfPresent(String.self, forKey: .provider_lat)
        provider_lon = try values.decodeIfPresent(String.self, forKey: .provider_lon)
        provider_post_code = try values.decodeIfPresent(String.self, forKey: .provider_post_code)
        provider_country = try values.decodeIfPresent(String.self, forKey: .provider_country)
        provider_country_id = try values.decodeIfPresent(String.self, forKey: .provider_country_id)
        facebook_url = try values.decodeIfPresent(String.self, forKey: .facebook_url)
        instagram_url = try values.decodeIfPresent(String.self, forKey: .instagram_url)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        about_me = try values.decodeIfPresent(String.self, forKey: .about_me)
        provider_logo = try values.decodeIfPresent(String.self, forKey: .provider_logo)
        radius = try values.decodeIfPresent(String.self, forKey: .radius)
        cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
        cat_name = try values.decodeIfPresent(String.self, forKey: .cat_name)
        cat_name_ar = try values.decodeIfPresent(String.self, forKey: .cat_name_ar)
        driver_choice = try values.decodeIfPresent(String.self, forKey: .driver_choice)
        direct_accepted = try values.decodeIfPresent(String.self, forKey: .direct_accepted)
        vehicle_name = try values.decodeIfPresent(String.self, forKey: .vehicle_name)
        vehicle_id = try values.decodeIfPresent(String.self, forKey: .vehicle_id)
        vehicle_type = try values.decodeIfPresent(String.self, forKey: .vehicle_type)
        driver_experience = try values.decodeIfPresent(String.self, forKey: .driver_experience)
        vehicle_delivery_type = try values.decodeIfPresent(String.self, forKey: .vehicle_delivery_type)
        service_id = try values.decodeIfPresent(String.self, forKey: .service_id)
        service_name = try values.decodeIfPresent(String.self, forKey: .service_name)
        sub_service_id = try values.decodeIfPresent(String.self, forKey: .sub_service_id)
        sub_service_name = try values.decodeIfPresent(String.self, forKey: .sub_service_name)
        registration_image = try values.decodeIfPresent(String.self, forKey: .registration_image)
        supervisor_name = try values.decodeIfPresent(String.self, forKey: .supervisor_name)
        supervisor_number = try values.decodeIfPresent(String.self, forKey: .supervisor_number)
        front_view = try values.decodeIfPresent(String.self, forKey: .front_view)
        rear_view = try values.decodeIfPresent(String.self, forKey: .rear_view)
        side_view = try values.decodeIfPresent(String.self, forKey: .side_view)
        registered_type = try values.decodeIfPresent(String.self, forKey: .registered_type)
    }

}

struct Place_OrderImage : Codable {
    let id : String?
    let request_id : String?
    let image : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case request_id = "request_id"
        case image = "image"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        request_id = try values.decodeIfPresent(String.self, forKey: .request_id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }

}
