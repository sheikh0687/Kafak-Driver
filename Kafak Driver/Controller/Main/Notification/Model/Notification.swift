//
//  Notification.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 03/03/25.
//

import Foundation

struct Api_Notification : Codable {
    let result : [Res_Notification]?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_Notification].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}

struct Res_Notification : Codable {
    let id : String?
    let user_id : String?
    let request_id : String?
    let title : String?
    let title_ar : String?
    let title_ur : String?
    let message : String?
    let message_ar : String?
    let message_ur : String?
    let description_ar : String?
    let description_ur : String?
    let type : String?
    let notification_type : String?
    let seen_status : String?
    let status : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case request_id = "request_id"
        case title = "title"
        case title_ar = "title_ar"
        case title_ur = "title_ur"
        case message = "message"
        case message_ar = "message_ar"
        case message_ur = "message_ur"
        case description_ar = "description_ar"
        case description_ur = "description_ur"
        case type = "type"
        case notification_type = "notification_type"
        case seen_status = "seen_status"
        case status = "status"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        request_id = try values.decodeIfPresent(String.self, forKey: .request_id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        title_ar = try values.decodeIfPresent(String.self, forKey: .title_ar)
        title_ur = try values.decodeIfPresent(String.self, forKey: .title_ur)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        message_ar = try values.decodeIfPresent(String.self, forKey: .message_ar)
        message_ur = try values.decodeIfPresent(String.self, forKey: .message_ur)
        description_ar = try values.decodeIfPresent(String.self, forKey: .description_ar)
        description_ur = try values.decodeIfPresent(String.self, forKey: .description_ur)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        notification_type = try values.decodeIfPresent(String.self, forKey: .notification_type)
        seen_status = try values.decodeIfPresent(String.self, forKey: .seen_status)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }

}
