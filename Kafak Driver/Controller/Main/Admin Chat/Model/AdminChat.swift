//
//  AdminChat.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 07/04/25.
//

import Foundation

struct Api_AdminChat : Codable {
    let result : [Res_AdminChat]?
    let message : String?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        
        case result = "result"
        case message = "message"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_AdminChat].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_AdminChat : Codable {
    let id : String?
    let user_id : String?
    let name : String?
    let contact_number : String?
    let email : String?
    let feedback : String?
    let subject : String?
    let message : String?
    let reply : String?
    let date_time : String?
    let no_of_message : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case user_id = "user_id"
        case name = "name"
        case contact_number = "contact_number"
        case email = "email"
        case feedback = "feedback"
        case subject = "subject"
        case message = "message"
        case reply = "reply"
        case date_time = "date_time"
        case no_of_message = "no_of_message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        contact_number = try values.decodeIfPresent(String.self, forKey: .contact_number)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        feedback = try values.decodeIfPresent(String.self, forKey: .feedback)
        subject = try values.decodeIfPresent(String.self, forKey: .subject)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        reply = try values.decodeIfPresent(String.self, forKey: .reply)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        no_of_message = try values.decodeIfPresent(Int.self, forKey: .no_of_message)
    }
}
