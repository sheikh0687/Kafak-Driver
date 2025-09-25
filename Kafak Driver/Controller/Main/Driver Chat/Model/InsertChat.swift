//
//  InsertChat.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 11/03/25.
//

import Foundation

struct ApiSendChat : Codable {
    
    let message : String?
    let result : ResSendChat?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case result = "result"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        result = try values.decodeIfPresent(ResSendChat.self, forKey: .result)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct ResSendChat : Codable {
    
    let chatImage : String?
    let chatMessage : String?
    let clearChat : String?
    let dateTime : String?
    let id : String?
    let receiverId : String?
    let requestId : String?
    let senderId : String?
    let status : String?
    let timezone : String?
    let type : String?
    
    enum CodingKeys: String, CodingKey {
        case chatImage = "chat_image"
        case chatMessage = "chat_message"
        case clearChat = "clear_chat"
        case dateTime = "date_time"
        case id = "id"
        case receiverId = "receiver_id"
        case requestId = "request_id"
        case senderId = "sender_id"
        case status = "status"
        case timezone = "timezone"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        chatImage = try values.decodeIfPresent(String.self, forKey: .chatImage)
        chatMessage = try values.decodeIfPresent(String.self, forKey: .chatMessage)
        clearChat = try values.decodeIfPresent(String.self, forKey: .clearChat)
        dateTime = try values.decodeIfPresent(String.self, forKey: .dateTime)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        receiverId = try values.decodeIfPresent(String.self, forKey: .receiverId)
        requestId = try values.decodeIfPresent(String.self, forKey: .requestId)
        senderId = try values.decodeIfPresent(String.self, forKey: .senderId)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

