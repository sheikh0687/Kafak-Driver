//
//  OfferByUser.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 09/09/25.
//

import Foundation

struct Api_OfferAcceptedByUser : Codable {
    let result : Res_OfferAcceptedByUser?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Res_OfferAcceptedByUser.self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_OfferAcceptedByUser : Codable {
    let id : String?
    let user_id : String?
    let provider_id : String?
    let product_id : String?
    let item_count : String?
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
    let driver_profit : String?
    let commission_from_client : String?
    let commission_from_driver : String?
    let delivery_date : String?
    let delivery_time : String?
    let date_time : String?
    let status : String?
    let self_delivery_status : String?
    let delivery_status : String?
    let payment_status : String?
    let payment_status_by_user : String?
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
    let admin_note : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case provider_id = "provider_id"
        case product_id = "product_id"
        case item_count = "item_count"
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
        case driver_profit = "driver_profit"
        case commission_from_client = "commission_from_client"
        case commission_from_driver = "commission_from_driver"
        case delivery_date = "delivery_date"
        case delivery_time = "delivery_time"
        case date_time = "date_time"
        case status = "status"
        case self_delivery_status = "self_delivery_status"
        case delivery_status = "delivery_status"
        case payment_status = "payment_status"
        case payment_status_by_user = "payment_status_by_user"
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
        case admin_note = "admin_note"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
        item_count = try values.decodeIfPresent(String.self, forKey: .item_count)
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
        driver_profit = try values.decodeIfPresent(String.self, forKey: .driver_profit)
        commission_from_client = try values.decodeIfPresent(String.self, forKey: .commission_from_client)
        commission_from_driver = try values.decodeIfPresent(String.self, forKey: .commission_from_driver)
        delivery_date = try values.decodeIfPresent(String.self, forKey: .delivery_date)
        delivery_time = try values.decodeIfPresent(String.self, forKey: .delivery_time)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        self_delivery_status = try values.decodeIfPresent(String.self, forKey: .self_delivery_status)
        delivery_status = try values.decodeIfPresent(String.self, forKey: .delivery_status)
        payment_status = try values.decodeIfPresent(String.self, forKey: .payment_status)
        payment_status_by_user = try values.decodeIfPresent(String.self, forKey: .payment_status_by_user)
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
        admin_note = try values.decodeIfPresent(String.self, forKey: .admin_note)
    }

}
