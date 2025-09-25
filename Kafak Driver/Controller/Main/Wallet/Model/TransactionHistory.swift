//
//  TransactionHistory.swift
//  Foodoo
//
//  Created by Techimmense Software Solutions on 29/04/24.
//

import Foundation

struct Api_TransactionHistory : Codable {
    let wallet : String?
    let total_earning : String?
    let result : [Res_TransactionHistory]?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case wallet = "wallet"
        case total_earning = "total_earning"
        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        wallet = try values.decodeIfPresent(String.self, forKey: .wallet)
        total_earning = try values.decodeIfPresent(String.self, forKey: .total_earning)
        result = try values.decodeIfPresent([Res_TransactionHistory].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_TransactionHistory : Codable {
    let id : String?
    let user_id : String?
    let provider_id : String?
    let request_id : String?
    let payment_method : String?
    let total_amount : String?
    let transaction_id : String?
    let transaction_type : String?
    let date_time : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case provider_id = "provider_id"
        case request_id = "request_id"
        case payment_method = "payment_method"
        case total_amount = "total_amount"
        case transaction_id = "transaction_id"
        case transaction_type = "transaction_type"
        case date_time = "date_time"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        request_id = try values.decodeIfPresent(String.self, forKey: .request_id)
        payment_method = try values.decodeIfPresent(String.self, forKey: .payment_method)
        total_amount = try values.decodeIfPresent(String.self, forKey: .total_amount)
        transaction_id = try values.decodeIfPresent(String.self, forKey: .transaction_id)
        transaction_type = try values.decodeIfPresent(String.self, forKey: .transaction_type)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
    }

}
