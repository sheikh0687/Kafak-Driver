//
//  MakeTabPaymentViewModel.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 22/04/25.
//

import Foundation
//import SwiftyJSON

class MakeTabPaymentViewModel {
    
    var tabPayAmt:String = ""
    var strAmount:String = ""
        
    var onPaymentSuccess: (() -> Void)?
    var onPaymentFailure: ((_ message: String) -> Void)?

    func handleRedirectResponse(jsonString: String, vC: UIViewController) {
        print("✅ Received JSON: \(jsonString)")

        guard let jsonData = jsonString.data(using: .utf8) else {
            onPaymentFailure?("Invalid JSON data")
            return
        }

        do {
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                print("✅ Parsed JSON: \(json)")

                if let status = json["status"] as? String, status.lowercased() == "success" {
                    // Call API or notify view
                    requestToAddWalletAmount(vC: vC)
                } else {
                    let message = json["message"] as? String ?? "Unknown error"
                    onPaymentFailure?(message)
                }
            }
        } catch {
            onPaymentFailure?("JSON Parsing Error: \(error.localizedDescription)")
        }
    }

    func requestToAddWalletAmount(vC: UIViewController) {
        var paramDict: [String : AnyObject] = [:]
        paramDict["user_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        paramDict["payment_method"] = "Card" as AnyObject
        paramDict["transaction_type"] = "Wallet" as AnyObject
        paramDict["total_amount"] = strAmount as AnyObject?
        
        print(paramDict)
        
        Api.shared.requestToAddWalletAmount(vC, paramDict) { responseData in
            self.onPaymentSuccess?()
        }
    }
}
 
