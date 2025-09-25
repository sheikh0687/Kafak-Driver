//
//  Offers.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/09/24.
//

import Foundation

struct Api_MakeOffers : Codable {
    
    let total_amount : String?
    let discount : String?
    let after_discount : String?
    let after_commission : String?
    let admin_commission : String?
    let offer_id : String?
    let result : String?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case total_amount = "total_amount"
        case discount = "discount"
        case after_discount = "after_discount"
        case after_commission = "after_commission"
        case admin_commission = "admin_commission"
        case offer_id = "offer_id"
        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_amount = try values.decodeIfPresent(String.self, forKey: .total_amount)
        discount = try values.decodeIfPresent(String.self, forKey: .discount)
        after_discount = try values.decodeIfPresent(String.self, forKey: .after_discount)
        after_commission = try values.decodeIfPresent(String.self, forKey: .after_commission)
        admin_commission = try values.decodeIfPresent(String.self, forKey: .admin_commission)
        offer_id = try values.decodeIfPresent(String.self, forKey: .offer_id)
        result = try values.decodeIfPresent(String.self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}
