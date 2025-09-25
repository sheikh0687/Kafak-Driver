//
//  AddRating.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 11/03/25.
//

import Foundation

struct Api_Rating : Codable {
    let result : Res_AddRating?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Res_AddRating.self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_AddRating : Codable {
    let id : String?
    let request_id : String?
    let form_id : String?
    let to_id : String?
    let welcome_rec_rating : String?
    let property_rating : String?
    let mood_rating : String?
    let service_quality_rating : String?
    let rating : String?
    let feedback : String?
    let type : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case request_id = "request_id"
        case form_id = "form_id"
        case to_id = "to_id"
        case welcome_rec_rating = "welcome_rec_rating"
        case property_rating = "property_rating"
        case mood_rating = "mood_rating"
        case service_quality_rating = "service_quality_rating"
        case rating = "rating"
        case feedback = "feedback"
        case type = "type"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        request_id = try values.decodeIfPresent(String.self, forKey: .request_id)
        form_id = try values.decodeIfPresent(String.self, forKey: .form_id)
        to_id = try values.decodeIfPresent(String.self, forKey: .to_id)
        welcome_rec_rating = try values.decodeIfPresent(String.self, forKey: .welcome_rec_rating)
        property_rating = try values.decodeIfPresent(String.self, forKey: .property_rating)
        mood_rating = try values.decodeIfPresent(String.self, forKey: .mood_rating)
        service_quality_rating = try values.decodeIfPresent(String.self, forKey: .service_quality_rating)
        rating = try values.decodeIfPresent(String.self, forKey: .rating)
        feedback = try values.decodeIfPresent(String.self, forKey: .feedback)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }

}
