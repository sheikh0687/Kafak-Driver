//
//  DriverChatViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 11/03/25.
//

import Foundation

class DriverChatViewModel {
    
    var receiver_Id: String = ""
    var request_Id: String = ""
    
    var arrayChatDetails: [Res_ChatDetails] = []
    var cloChatReceived: (() -> Void)?
    
    func fetchChatDetails(vC: UIViewController) {
        var paramDict: [String : AnyObject] = [:]
        paramDict["receiver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["sender_id"] = receiver_Id as AnyObject
        paramDict["request_id"] = request_Id as AnyObject
        paramDict["type"] = "Normal" as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToUserChatDetails(vC, paramDict) { responseData in
            if responseData.count > 0 {
                self.arrayChatDetails = responseData
            } else {
                self.arrayChatDetails = []
            }
            self.cloChatReceived?()
        }
    }
    
    var image:UIImage?
    var strTextMessage: String = ""
    var cloInsertChatSuccess: (() -> Void)?
    var cloImagePicked: (() -> Void)?
    
    func insertUserChat(vC: UIViewController) {
        
        var paramDict: [String : String] = [:]
        paramDict["receiver_id"] = self.receiver_Id
        paramDict["sender_id"] = k.userDefault.value(forKey: k.session.userId) as? String
        paramDict["request_id"] = request_Id
        paramDict["type"] = "Normal"
        paramDict["chat_message"] = strTextMessage
        paramDict["timezone"] = localTimeZoneIdentifier
        paramDict["date_time"] = CURRENT_TIME
        
        print(paramDict)
        
        var paramImgDict: [String : UIImage] = [:]
        paramImgDict["chat_image"] = self.image
        
        print(paramImgDict)
        
        Api.shared.requestToSendChat(vC, paramDict, images: paramImgDict, videos: [:]) { responseData in
            self.cloInsertChatSuccess?()
        }
    }
    
    func configureCamera(vC: UIViewController) {
        CameraHandler.shared.showActionSheet(vc: vC)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.image = image
            self.cloImagePicked?()
        }
    }
}
