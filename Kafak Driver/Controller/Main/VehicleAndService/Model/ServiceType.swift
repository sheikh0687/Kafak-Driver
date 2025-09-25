//
//  ServiceType.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 01/03/25.
//

import Foundation

struct Api_ServiceDetails : Codable {
    let result : [Res_ServiceDetails]?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_ServiceDetails].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_ServiceDetails : Codable {
    let id : String?
    let admin_product_id : String?
    let provider_id : String?
    let cat_id : String?
    let cat_name : String?
    let item_name : String?
    let item_name_ar : String?
    let item_name_ur : String?
    let item_price : String?
    let offer_item_price : String?
    let item_description : String?
    let item_quantity : String?
    let colour : String?
    let brand : String?
    let unit_measurement : String?
    let weight : String?
    let product_size : String?
    let status : String?
    let type : String?
    let item_type : String?
    let description : String?
    let description_ar : String?
    let available_status : String?
    let date_time : String?
    let remove_status : String?
    let driver_choice : String?
    let direct_accepted : String?
    let vehicle_id : String?
    let order_method : String?
    let note_for_user : String?
    let note_for_user_ar : String?
    let service_type : String?
    let retnal_time : String?
    let per_month_price : String?
    let per_day_price : String?
    let per_hour_price : String?
    let product_additional : [String]?
    let product_images : [Product_images]?
    let avg_rating : Int?
    let total_rating_count : String?
    let product_size_price : [String]?
//    let provider_details : Provider_details?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case admin_product_id = "admin_product_id"
        case provider_id = "provider_id"
        case cat_id = "cat_id"
        case cat_name = "cat_name"
        case item_name = "item_name"
        case item_name_ar = "item_name_ar"
        case item_name_ur = "item_name_ur"
        case item_price = "item_price"
        case offer_item_price = "offer_item_price"
        case item_description = "item_description"
        case item_quantity = "item_quantity"
        case colour = "colour"
        case brand = "brand"
        case unit_measurement = "unit_measurement"
        case weight = "weight"
        case product_size = "product_size"
        case status = "status"
        case type = "type"
        case item_type = "item_type"
        case description = "description"
        case description_ar = "description_ar"
        case available_status = "available_status"
        case date_time = "date_time"
        case remove_status = "remove_status"
        case driver_choice = "driver_choice"
        case direct_accepted = "direct_accepted"
        case vehicle_id = "vehicle_id"
        case order_method = "order_method"
        case note_for_user = "note_for_user"
        case note_for_user_ar = "note_for_user_ar"
        case service_type = "service_type"
        case retnal_time = "retnal_time"
        case per_month_price = "per_month_price"
        case per_day_price = "per_day_price"
        case per_hour_price = "per_hour_price"
        case product_additional = "product_additional"
        case product_images = "product_images"
        case avg_rating = "avg_rating"
        case total_rating_count = "total_rating_count"
        case product_size_price = "product_size_price"
//        case provider_details = "provider_details"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        admin_product_id = try values.decodeIfPresent(String.self, forKey: .admin_product_id)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
        cat_name = try values.decodeIfPresent(String.self, forKey: .cat_name)
        item_name = try values.decodeIfPresent(String.self, forKey: .item_name)
        item_name_ar = try values.decodeIfPresent(String.self, forKey: .item_name_ar)
        item_name_ur = try values.decodeIfPresent(String.self, forKey: .item_name_ur)
        item_price = try values.decodeIfPresent(String.self, forKey: .item_price)
        offer_item_price = try values.decodeIfPresent(String.self, forKey: .offer_item_price)
        item_description = try values.decodeIfPresent(String.self, forKey: .item_description)
        item_quantity = try values.decodeIfPresent(String.self, forKey: .item_quantity)
        colour = try values.decodeIfPresent(String.self, forKey: .colour)
        brand = try values.decodeIfPresent(String.self, forKey: .brand)
        unit_measurement = try values.decodeIfPresent(String.self, forKey: .unit_measurement)
        weight = try values.decodeIfPresent(String.self, forKey: .weight)
        product_size = try values.decodeIfPresent(String.self, forKey: .product_size)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        item_type = try values.decodeIfPresent(String.self, forKey: .item_type)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        description_ar = try values.decodeIfPresent(String.self, forKey: .description_ar)
        available_status = try values.decodeIfPresent(String.self, forKey: .available_status)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        remove_status = try values.decodeIfPresent(String.self, forKey: .remove_status)
        driver_choice = try values.decodeIfPresent(String.self, forKey: .driver_choice)
        direct_accepted = try values.decodeIfPresent(String.self, forKey: .direct_accepted)
        vehicle_id = try values.decodeIfPresent(String.self, forKey: .vehicle_id)
        order_method = try values.decodeIfPresent(String.self, forKey: .order_method)
        note_for_user = try values.decodeIfPresent(String.self, forKey: .note_for_user)
        note_for_user_ar = try values.decodeIfPresent(String.self, forKey: .note_for_user_ar)
        service_type = try values.decodeIfPresent(String.self, forKey: .service_type)
        retnal_time = try values.decodeIfPresent(String.self, forKey: .retnal_time)
        per_month_price = try values.decodeIfPresent(String.self, forKey: .per_month_price)
        per_day_price = try values.decodeIfPresent(String.self, forKey: .per_day_price)
        per_hour_price = try values.decodeIfPresent(String.self, forKey: .per_hour_price)
        product_additional = try values.decodeIfPresent([String].self, forKey: .product_additional)
        product_images = try values.decodeIfPresent([Product_images].self, forKey: .product_images)
        avg_rating = try values.decodeIfPresent(Int.self, forKey: .avg_rating)
        total_rating_count = try values.decodeIfPresent(String.self, forKey: .total_rating_count)
        product_size_price = try values.decodeIfPresent([String].self, forKey: .product_size_price)
//        provider_details = try values.decodeIfPresent(Provider_details.self, forKey: .provider_details)
    }

}
