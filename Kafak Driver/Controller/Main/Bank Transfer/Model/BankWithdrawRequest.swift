//
//  BankWithdrawRequest.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 05/04/25.
//

import Foundation

struct Api_BankWithdrawRequest : Codable {
    let result : Res_BankWithdrawRequest?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Res_BankWithdrawRequest.self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_BankWithdrawRequest : Codable {
    let id : String?
    let user_id : String?
    let amount : String?
    let branch : String?
    let account_holder_name : String?
    let account_number : String?
    let ifsc_code : String?
    let description : String?
    let status : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case amount = "amount"
        case branch = "branch"
        case account_holder_name = "account_holder_name"
        case account_number = "account_number"
        case ifsc_code = "ifsc_code"
        case description = "description"
        case status = "status"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        amount = try values.decodeIfPresent(String.self, forKey: .amount)
        branch = try values.decodeIfPresent(String.self, forKey: .branch)
        account_holder_name = try values.decodeIfPresent(String.self, forKey: .account_holder_name)
        account_number = try values.decodeIfPresent(String.self, forKey: .account_number)
        ifsc_code = try values.decodeIfPresent(String.self, forKey: .ifsc_code)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }
}
