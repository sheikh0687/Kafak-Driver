//
//  UpdatePlaceBid.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 01/03/25.
//

import Foundation

struct Api_UpdatePlacebid : Codable {
    let result : Res_UpdatePlacebid?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Res_UpdatePlacebid.self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_UpdatePlacebid : Codable {
    let id : String?
    let driver_id : String?
    let order_user_id : String?
    let order_id : String?
    let amount : String?
    let item_count : String?
    let status : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case driver_id = "driver_id"
        case order_user_id = "order_user_id"
        case order_id = "order_id"
        case amount = "amount"
        case item_count = "item_count"
        case status = "status"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        driver_id = try values.decodeIfPresent(String.self, forKey: .driver_id)
        order_user_id = try values.decodeIfPresent(String.self, forKey: .order_user_id)
        order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
        amount = try values.decodeIfPresent(String.self, forKey: .amount)
        item_count = try values.decodeIfPresent(String.self, forKey: .item_count)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }
}
