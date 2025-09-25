//
//  WithdrawAmountReq.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 09/04/25.
//

import Foundation

struct Api_WithdrawAmountRequest : Codable {
    let result : [Res_WithdrawAmountRequest]?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_WithdrawAmountRequest].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_WithdrawAmountRequest : Codable {
    let id : String?
    let user_id : String?
    let iBAN_Number : String?
    let bank_name : String?
    let account_type : String?
    let amount : String?
    let branch : String?
    let account_holder_name : String?
    let account_number : String?
    let ifsc_code : String?
    let description : String?
    let trasaction_type : String?
    let method : String?
    let admin : String?
    let openration_number : String?
    let image : String?
    let status : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case iBAN_Number = "IBAN_Number"
        case bank_name = "bank_name"
        case account_type = "account_type"
        case amount = "amount"
        case branch = "branch"
        case account_holder_name = "account_holder_name"
        case account_number = "account_number"
        case ifsc_code = "ifsc_code"
        case description = "description"
        case trasaction_type = "trasaction_type"
        case method = "method"
        case admin = "admin"
        case openration_number = "openration_number"
        case image = "image"
        case status = "status"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        iBAN_Number = try values.decodeIfPresent(String.self, forKey: .iBAN_Number)
        bank_name = try values.decodeIfPresent(String.self, forKey: .bank_name)
        account_type = try values.decodeIfPresent(String.self, forKey: .account_type)
        amount = try values.decodeIfPresent(String.self, forKey: .amount)
        branch = try values.decodeIfPresent(String.self, forKey: .branch)
        account_holder_name = try values.decodeIfPresent(String.self, forKey: .account_holder_name)
        account_number = try values.decodeIfPresent(String.self, forKey: .account_number)
        ifsc_code = try values.decodeIfPresent(String.self, forKey: .ifsc_code)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        trasaction_type = try values.decodeIfPresent(String.self, forKey: .trasaction_type)
        method = try values.decodeIfPresent(String.self, forKey: .method)
        admin = try values.decodeIfPresent(String.self, forKey: .admin)
        openration_number = try values.decodeIfPresent(String.self, forKey: .openration_number)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }

}
