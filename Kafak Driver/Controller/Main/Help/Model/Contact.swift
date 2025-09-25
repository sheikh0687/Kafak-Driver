//
//  Contact.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/03/25.
//

import Foundation

struct Api_ContactInfo : Codable {
    let result : Res_Contact?
    let message : String?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        
        case result = "result"
        case message = "message"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Res_Contact.self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_Contact : Codable {
    let id : String?
    let user_id : String?
    let name : String?
    let contact_number : String?
    let email : String?
    let feedback : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case name = "name"
        case contact_number = "contact_number"
        case email = "email"
        case feedback = "feedback"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        contact_number = try values.decodeIfPresent(String.self, forKey: .contact_number)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        feedback = try values.decodeIfPresent(String.self, forKey: .feedback)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }

}
