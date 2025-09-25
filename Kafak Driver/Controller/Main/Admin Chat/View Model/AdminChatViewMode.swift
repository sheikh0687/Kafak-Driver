//
//  AdminChatViewMode.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 07/04/25.
//

import Foundation

class AdminChatViewMode {
    
    var arrayChatRequest: [Res_AdminChat] = []
    var cloSuccessfullChat:() -> Void = {}
    
    func requestToGetAdminChatRequest(vC: UIViewController) {
        Api.shared.requestToAdminChat(vC) { responseData in
            if responseData.count > 0 {
                self.arrayChatRequest = responseData
            } else {
                self.arrayChatRequest = []
            }
            self.cloSuccessfullChat()
        }
    }
}
