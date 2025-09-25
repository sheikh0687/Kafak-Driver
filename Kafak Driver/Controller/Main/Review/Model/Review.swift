//
//  Review.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 11/03/25.
//

import Foundation

struct Api_ReviewList : Codable {
    let result : [Res_ReviewList]?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_ReviewList].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}

struct Res_ReviewList : Codable {
    let id : String?
    let request_id : String?
    let product_id : String?
    let to_id : String?
    let from_id : String?
    let provider_id : String?
    let user_id : String?
    let driver_id : String?
    let rating : String?
    let review : String?
    let date_time : String?
    let type : String?
    let avg_rating : Double?
    let user_name : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case request_id = "request_id"
        case product_id = "product_id"
        case to_id = "to_id"
        case from_id = "from_id"
        case provider_id = "provider_id"
        case user_id = "user_id"
        case driver_id = "driver_id"
        case rating = "rating"
        case review = "review"
        case date_time = "date_time"
        case type = "type"
        case avg_rating = "avg_rating"
        case user_name = "user_name"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        request_id = try values.decodeIfPresent(String.self, forKey: .request_id)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
        to_id = try values.decodeIfPresent(String.self, forKey: .to_id)
        from_id = try values.decodeIfPresent(String.self, forKey: .from_id)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        driver_id = try values.decodeIfPresent(String.self, forKey: .driver_id)
        rating = try values.decodeIfPresent(String.self, forKey: .rating)
        review = try values.decodeIfPresent(String.self, forKey: .review)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        avg_rating = try values.decodeIfPresent(Double.self, forKey: .avg_rating)
        user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
