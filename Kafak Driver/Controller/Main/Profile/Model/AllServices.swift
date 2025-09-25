//
//  AllServices.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/02/25.
//

import Foundation

struct Api_Service : Codable {
    let result : [Res_Services]?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_Services].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_Services : Codable {
    let id : String?
    let store_id : String?
    let category_name : String?
    let category_name_ar : String?
    let category_name_ur : String?
    let image : String?
    let address : String?
    let lat : String?
    let lon : String?
    let description : String?
    let description_ar : String?
    let service_type : String?
    let price : String?
    let time : String?
    let note : String?
    let note_ar : String?
    let status : String?
    let type : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case store_id = "store_id"
        case category_name = "category_name"
        case category_name_ar = "category_name_ar"
        case category_name_ur = "category_name_ur"
        case image = "image"
        case address = "address"
        case lat = "lat"
        case lon = "lon"
        case description = "description"
        case description_ar = "description_ar"
        case service_type = "service_type"
        case price = "price"
        case time = "time"
        case note = "note"
        case note_ar = "note_ar"
        case status = "status"
        case type = "type"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        store_id = try values.decodeIfPresent(String.self, forKey: .store_id)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        category_name_ar = try values.decodeIfPresent(String.self, forKey: .category_name_ar)
        category_name_ur = try values.decodeIfPresent(String.self, forKey: .category_name_ur)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lon = try values.decodeIfPresent(String.self, forKey: .lon)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        description_ar = try values.decodeIfPresent(String.self, forKey: .description_ar)
        service_type = try values.decodeIfPresent(String.self, forKey: .service_type)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        time = try values.decodeIfPresent(String.self, forKey: .time)
        note = try values.decodeIfPresent(String.self, forKey: .note)
        note_ar = try values.decodeIfPresent(String.self, forKey: .note_ar)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }

}
