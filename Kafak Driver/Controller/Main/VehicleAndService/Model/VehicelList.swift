//
//  VehicelList.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/02/25.
//

import Foundation

struct Api_VehicleList : Codable {
    let result : [Res_VehicleList]?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_VehicleList].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_VehicleList : Codable {
    let id : String?
    let vehicle : String?
    let vehicle_ar : String?
    let vehicle_ur : String?
    let image : String?
    let base_fare : String?
    let price_km : String?
    let price_weight : String?
    let price_length : String?
    let priority_price_km : String?
    let capacity : String?
    let date_time : String?
    let is_select : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case vehicle = "vehicle"
        case vehicle_ar = "vehicle_ar"
        case vehicle_ur = "vehicle_ur"
        case image = "image"
        case base_fare = "base_fare"
        case price_km = "price_km"
        case price_weight = "price_weight"
        case price_length = "price_length"
        case priority_price_km = "priority_price_km"
        case capacity = "capacity"
        case date_time = "date_time"
        case is_select = "is_select"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        vehicle = try values.decodeIfPresent(String.self, forKey: .vehicle)
        vehicle_ar = try values.decodeIfPresent(String.self, forKey: .vehicle_ar)
        vehicle_ur = try values.decodeIfPresent(String.self, forKey: .vehicle_ur)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        base_fare = try values.decodeIfPresent(String.self, forKey: .base_fare)
        price_km = try values.decodeIfPresent(String.self, forKey: .price_km)
        price_weight = try values.decodeIfPresent(String.self, forKey: .price_weight)
        price_length = try values.decodeIfPresent(String.self, forKey: .price_length)
        priority_price_km = try values.decodeIfPresent(String.self, forKey: .priority_price_km)
        capacity = try values.decodeIfPresent(String.self, forKey: .capacity)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        is_select = try values.decodeIfPresent(String.self, forKey: .is_select)
    }

}
