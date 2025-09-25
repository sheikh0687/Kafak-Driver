//
//  Onboarding.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 09/04/25.
//

import Foundation

struct Api_OnBoarding : Codable {
    let result : [Res_OnBoarding]?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_OnBoarding].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_OnBoarding : Codable {
    let id : String?
    let title : String?
    let title_ar : String?
    let description : String?
    let description_ar : String?
    let image : String?
    let type : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case title_ar = "title_ar"
        case description = "description"
        case description_ar = "description_ar"
        case image = "image"
        case type = "type"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        title_ar = try values.decodeIfPresent(String.self, forKey: .title_ar)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        description_ar = try values.decodeIfPresent(String.self, forKey: .description_ar)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }

}
