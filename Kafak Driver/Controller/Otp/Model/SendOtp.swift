//
//  SendOtp.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 29/08/25.
//

import Foundation

struct Api_SendOtp : Codable {
    let result : Res_SendOtp?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Res_SendOtp.self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_SendOtp : Codable {
    let code : String?
    let user_id : String?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case user_id = "user_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
    }
}
