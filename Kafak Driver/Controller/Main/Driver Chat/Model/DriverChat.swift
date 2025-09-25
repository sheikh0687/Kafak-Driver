//
//  DriverChat.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 11/03/25.
//

import Foundation

struct Api_ChatDetails : Codable {
    let result : [Res_ChatDetails]?
    let status : String?
    let message : String?

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_ChatDetails].self, forKey: .result)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
}

struct Res_ChatDetails : Codable {
    let id : String?
    let sender_id : String?
    let receiver_id : String?
    let chat_message : String?
    let request_id : String?
    let chat_image : String?
    let clear_chat : String?
    let type : String?
    let timezone : String?
    let date_time : String?
    let status : String?
    let result : String?
    let sender_detail : Sender_detail?
    let receiver_detail : Receiver_detail?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case sender_id = "sender_id"
        case receiver_id = "receiver_id"
        case chat_message = "chat_message"
        case request_id = "request_id"
        case chat_image = "chat_image"
        case clear_chat = "clear_chat"
        case type = "type"
        case timezone = "timezone"
        case date_time = "date_time"
        case status = "status"
        case result = "result"
        case sender_detail = "sender_detail"
        case receiver_detail = "receiver_detail"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        sender_id = try values.decodeIfPresent(String.self, forKey: .sender_id)
        receiver_id = try values.decodeIfPresent(String.self, forKey: .receiver_id)
        chat_message = try values.decodeIfPresent(String.self, forKey: .chat_message)
        request_id = try values.decodeIfPresent(String.self, forKey: .request_id)
        chat_image = try values.decodeIfPresent(String.self, forKey: .chat_image)
        clear_chat = try values.decodeIfPresent(String.self, forKey: .clear_chat)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        result = try values.decodeIfPresent(String.self, forKey: .result)
        sender_detail = try values.decodeIfPresent(Sender_detail.self, forKey: .sender_detail)
        receiver_detail = try values.decodeIfPresent(Receiver_detail.self, forKey: .receiver_detail)
    }
}

struct Sender_detail : Codable {
    let id : String?
    let store_id : String?
    let first_name : String?
    let last_name : String?
    let store_name : String?
    let mobile : String?
    let mobile_with_code : String?
    let email : String?
    let password : String?
    let country_id : String?
    let country_name : String?
    let state_id : String?
    let state_name : String?
    let city_id : String?
    let city_name : String?
    let image : String?
    let type : String?
    let social_id : String?
    let lat : String?
    let lon : String?
    let address : String?
    let addresstype : String?
    let address_id : String?
    let gender : String?
    let gender_type : String?
    let wallet : String?
    let register_id : String?
    let ios_register_id : String?
    let status : String?
    let approve_status : String?
    let available_status : String?
    let code : String?
    let date_time : String?
    let cat_id : String?
    let cat_name : String?
    let cat_name_ar : String?
    let cat_name_bng : String?
    let sub_cat_id : String?
    let sub_cat_name : String?
    let sub_cat_name_ar : String?
    let sub_cat_name_bng : String?
    let university_name : String?
    let dob : String?
    let age : String?
    let consultant_fees : String?
    let experience_year : String?
    let note : String?
    let note_block : String?
    let block_unblock : String?
    let remove_status : String?
    let sender_image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case store_id = "store_id"
        case first_name = "first_name"
        case last_name = "last_name"
        case store_name = "store_name"
        case mobile = "mobile"
        case mobile_with_code = "mobile_with_code"
        case email = "email"
        case password = "password"
        case country_id = "country_id"
        case country_name = "country_name"
        case state_id = "state_id"
        case state_name = "state_name"
        case city_id = "city_id"
        case city_name = "city_name"
        case image = "image"
        case type = "type"
        case social_id = "social_id"
        case lat = "lat"
        case lon = "lon"
        case address = "address"
        case addresstype = "addresstype"
        case address_id = "address_id"
        case gender = "gender"
        case gender_type = "gender_type"
        case wallet = "wallet"
        case register_id = "register_id"
        case ios_register_id = "ios_register_id"
        case status = "status"
        case approve_status = "approve_status"
        case available_status = "available_status"
        case code = "code"
        case date_time = "date_time"
        case cat_id = "cat_id"
        case cat_name = "cat_name"
        case cat_name_ar = "cat_name_ar"
        case cat_name_bng = "cat_name_bng"
        case sub_cat_id = "sub_cat_id"
        case sub_cat_name = "sub_cat_name"
        case sub_cat_name_ar = "sub_cat_name_ar"
        case sub_cat_name_bng = "sub_cat_name_bng"
        case university_name = "university_name"
        case dob = "dob"
        case age = "age"
        case consultant_fees = "consultant_fees"
        case experience_year = "experience_year"
        case note = "note"
        case note_block = "note_block"
        case block_unblock = "block_unblock"
        case remove_status = "remove_status"
        case sender_image = "sender_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        store_id = try values.decodeIfPresent(String.self, forKey: .store_id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        store_name = try values.decodeIfPresent(String.self, forKey: .store_name)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        mobile_with_code = try values.decodeIfPresent(String.self, forKey: .mobile_with_code)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        country_id = try values.decodeIfPresent(String.self, forKey: .country_id)
        country_name = try values.decodeIfPresent(String.self, forKey: .country_name)
        state_id = try values.decodeIfPresent(String.self, forKey: .state_id)
        state_name = try values.decodeIfPresent(String.self, forKey: .state_name)
        city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
        city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        social_id = try values.decodeIfPresent(String.self, forKey: .social_id)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lon = try values.decodeIfPresent(String.self, forKey: .lon)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        addresstype = try values.decodeIfPresent(String.self, forKey: .addresstype)
        address_id = try values.decodeIfPresent(String.self, forKey: .address_id)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        gender_type = try values.decodeIfPresent(String.self, forKey: .gender_type)
        wallet = try values.decodeIfPresent(String.self, forKey: .wallet)
        register_id = try values.decodeIfPresent(String.self, forKey: .register_id)
        ios_register_id = try values.decodeIfPresent(String.self, forKey: .ios_register_id)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        approve_status = try values.decodeIfPresent(String.self, forKey: .approve_status)
        available_status = try values.decodeIfPresent(String.self, forKey: .available_status)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
        cat_name = try values.decodeIfPresent(String.self, forKey: .cat_name)
        cat_name_ar = try values.decodeIfPresent(String.self, forKey: .cat_name_ar)
        cat_name_bng = try values.decodeIfPresent(String.self, forKey: .cat_name_bng)
        sub_cat_id = try values.decodeIfPresent(String.self, forKey: .sub_cat_id)
        sub_cat_name = try values.decodeIfPresent(String.self, forKey: .sub_cat_name)
        sub_cat_name_ar = try values.decodeIfPresent(String.self, forKey: .sub_cat_name_ar)
        sub_cat_name_bng = try values.decodeIfPresent(String.self, forKey: .sub_cat_name_bng)
        university_name = try values.decodeIfPresent(String.self, forKey: .university_name)
        dob = try values.decodeIfPresent(String.self, forKey: .dob)
        age = try values.decodeIfPresent(String.self, forKey: .age)
        consultant_fees = try values.decodeIfPresent(String.self, forKey: .consultant_fees)
        experience_year = try values.decodeIfPresent(String.self, forKey: .experience_year)
        note = try values.decodeIfPresent(String.self, forKey: .note)
        note_block = try values.decodeIfPresent(String.self, forKey: .note_block)
        block_unblock = try values.decodeIfPresent(String.self, forKey: .block_unblock)
        remove_status = try values.decodeIfPresent(String.self, forKey: .remove_status)
        sender_image = try values.decodeIfPresent(String.self, forKey: .sender_image)
    }
}

struct Receiver_detail : Codable {
    let id : String?
    let store_id : String?
    let first_name : String?
    let last_name : String?
    let store_name : String?
    let mobile : String?
    let mobile_with_code : String?
    let email : String?
    let password : String?
    let country_id : String?
    let country_name : String?
    let state_id : String?
    let state_name : String?
    let city_id : String?
    let city_name : String?
    let image : String?
    let type : String?
    let social_id : String?
    let lat : String?
    let lon : String?
    let address : String?
    let addresstype : String?
    let address_id : String?
    let gender : String?
    let gender_type : String?
    let wallet : String?
    let register_id : String?
    let ios_register_id : String?
    let status : String?
    let approve_status : String?
    let available_status : String?
    let code : String?
    let date_time : String?
    let cat_id : String?
    let cat_name : String?
    let cat_name_ar : String?
    let cat_name_bng : String?
    let sub_cat_id : String?
    let sub_cat_name : String?
    let sub_cat_name_ar : String?
    let sub_cat_name_bng : String?
    let university_name : String?
    let dob : String?
    let age : String?
    let consultant_fees : String?
    let experience_year : String?
    let note : String?
    let note_block : String?
    let block_unblock : String?
    let remove_status : String?
    let receiver_image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case store_id = "store_id"
        case first_name = "first_name"
        case last_name = "last_name"
        case store_name = "store_name"
        case mobile = "mobile"
        case mobile_with_code = "mobile_with_code"
        case email = "email"
        case password = "password"
        case country_id = "country_id"
        case country_name = "country_name"
        case state_id = "state_id"
        case state_name = "state_name"
        case city_id = "city_id"
        case city_name = "city_name"
        case image = "image"
        case type = "type"
        case social_id = "social_id"
        case lat = "lat"
        case lon = "lon"
        case address = "address"
        case addresstype = "addresstype"
        case address_id = "address_id"
        case gender = "gender"
        case gender_type = "gender_type"
        case wallet = "wallet"
        case register_id = "register_id"
        case ios_register_id = "ios_register_id"
        case status = "status"
        case approve_status = "approve_status"
        case available_status = "available_status"
        case code = "code"
        case date_time = "date_time"
        case cat_id = "cat_id"
        case cat_name = "cat_name"
        case cat_name_ar = "cat_name_ar"
        case cat_name_bng = "cat_name_bng"
        case sub_cat_id = "sub_cat_id"
        case sub_cat_name = "sub_cat_name"
        case sub_cat_name_ar = "sub_cat_name_ar"
        case sub_cat_name_bng = "sub_cat_name_bng"
        case university_name = "university_name"
        case dob = "dob"
        case age = "age"
        case consultant_fees = "consultant_fees"
        case experience_year = "experience_year"
        case note = "note"
        case note_block = "note_block"
        case block_unblock = "block_unblock"
        case remove_status = "remove_status"
        case receiver_image = "receiver_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        store_id = try values.decodeIfPresent(String.self, forKey: .store_id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        store_name = try values.decodeIfPresent(String.self, forKey: .store_name)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        mobile_with_code = try values.decodeIfPresent(String.self, forKey: .mobile_with_code)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        country_id = try values.decodeIfPresent(String.self, forKey: .country_id)
        country_name = try values.decodeIfPresent(String.self, forKey: .country_name)
        state_id = try values.decodeIfPresent(String.self, forKey: .state_id)
        state_name = try values.decodeIfPresent(String.self, forKey: .state_name)
        city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
        city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        social_id = try values.decodeIfPresent(String.self, forKey: .social_id)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lon = try values.decodeIfPresent(String.self, forKey: .lon)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        addresstype = try values.decodeIfPresent(String.self, forKey: .addresstype)
        address_id = try values.decodeIfPresent(String.self, forKey: .address_id)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        gender_type = try values.decodeIfPresent(String.self, forKey: .gender_type)
        wallet = try values.decodeIfPresent(String.self, forKey: .wallet)
        register_id = try values.decodeIfPresent(String.self, forKey: .register_id)
        ios_register_id = try values.decodeIfPresent(String.self, forKey: .ios_register_id)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        approve_status = try values.decodeIfPresent(String.self, forKey: .approve_status)
        available_status = try values.decodeIfPresent(String.self, forKey: .available_status)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
        cat_name = try values.decodeIfPresent(String.self, forKey: .cat_name)
        cat_name_ar = try values.decodeIfPresent(String.self, forKey: .cat_name_ar)
        cat_name_bng = try values.decodeIfPresent(String.self, forKey: .cat_name_bng)
        sub_cat_id = try values.decodeIfPresent(String.self, forKey: .sub_cat_id)
        sub_cat_name = try values.decodeIfPresent(String.self, forKey: .sub_cat_name)
        sub_cat_name_ar = try values.decodeIfPresent(String.self, forKey: .sub_cat_name_ar)
        sub_cat_name_bng = try values.decodeIfPresent(String.self, forKey: .sub_cat_name_bng)
        university_name = try values.decodeIfPresent(String.self, forKey: .university_name)
        dob = try values.decodeIfPresent(String.self, forKey: .dob)
        age = try values.decodeIfPresent(String.self, forKey: .age)
        consultant_fees = try values.decodeIfPresent(String.self, forKey: .consultant_fees)
        experience_year = try values.decodeIfPresent(String.self, forKey: .experience_year)
        note = try values.decodeIfPresent(String.self, forKey: .note)
        note_block = try values.decodeIfPresent(String.self, forKey: .note_block)
        block_unblock = try values.decodeIfPresent(String.self, forKey: .block_unblock)
        remove_status = try values.decodeIfPresent(String.self, forKey: .remove_status)
        receiver_image = try values.decodeIfPresent(String.self, forKey: .receiver_image)
    }
}
