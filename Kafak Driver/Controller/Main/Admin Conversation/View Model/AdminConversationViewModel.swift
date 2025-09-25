//
//  AdminConversationViewModel.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 07/04/25.
//

import Foundation

class AdminConversationViewModel {
    
    var strRequestId: String = ""
    var strTextMessage:String = ""
    
    var arrayChatDetails: [Res_AdminConversation] = []
    var cloChatReceived: (() -> Void)?
    
    func fetchChatDetails(vC: UIViewController) {
        var paramDict: [String : AnyObject] = [:]
        paramDict["request_id"] = strRequestId as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToAdminChatDetails(vC, paramDict) { responseData in
            if responseData.count > 0 {
                self.arrayChatDetails = responseData
            } else {
                self.arrayChatDetails = []
            }
            self.cloChatReceived?()
        }
    }
    
    var cloSendChatSuccessfully: (() -> Void)?
    
    func requestToInsertAdminChat(vC: UIViewController) {
        
        var paramDict: [String : String] = [:]
        paramDict["sender_id"] = k.userDefault.value(forKey: k.session.userId) as! String?
        paramDict["receiver_id"] = "1"
        paramDict["request_id"] = strRequestId
        paramDict["chat_message"] = strTextMessage
        paramDict["timezone"] = localTimeZoneIdentifier 
        
        print(paramDict)
        
        Api.shared.requestToSendAdminChat(vC, paramDict, images: [:], videos: [:]) { responseData in
            self.cloSendChatSuccessfully?()
        }
    }
}
