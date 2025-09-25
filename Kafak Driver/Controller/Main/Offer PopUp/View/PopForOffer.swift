//
//  PopForOffer.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 21/02/25.
//

import UIKit

class PopForOffer: UIViewController {

    @IBOutlet weak var txt_OfferAmt: UITextField!
    @IBOutlet weak var lbl_TotalAmount: UILabel!
    @IBOutlet weak var lbl_TotalCount: UILabel!
    
    var isUpdate:String = ""
    var strBidAmount:String = ""
    var strTotalCount:String = ""
    var staticCountVal:Int = 0
    var totalCount:Int = 0
    
    var cloUpdateBid:((String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isUpdate == "Yes" {
            self.txt_OfferAmt.text = strBidAmount
            self.lbl_TotalCount.text = strTotalCount

            // Safely convert bid amount to Double first
            let bidAmountDouble = Double(strBidAmount) ?? 0.0
            let totalCount = Int(strTotalCount) ?? 0

            // Multiply, then convert to Int if needed
            let totalAmount = Int(bidAmountDouble * Double(totalCount))

            print("Bid Amount: \(bidAmountDouble)")
            print("Total Amount: \(totalAmount)")

            self.lbl_TotalAmount.text = "Total: \(totalAmount).00 SR"
        } else {
            self.lbl_TotalCount.text = strTotalCount
            self.lbl_TotalAmount.isHidden = true
        }
    }
    
    @IBAction func btn_Send(_ sender: UIButton) {
        if txt_OfferAmt.hasText {
            cloUpdateBid?(self.txt_OfferAmt.text ?? "")
            self.dismiss(animated: true)
        } else {
            self.alert(alertmessage: R.string.localizable.pleaseEnterTheBidAmount())
        }
    }
    
    @IBAction func btn_Cancel(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btn_Minus(_ sender: UIButton) {
        totalCount = Int(strTotalCount) ?? 0
        print(totalCount)
        if totalCount > 1 {
            totalCount -= 1
            strTotalCount = String(totalCount)
            self.lbl_TotalCount.text = String(totalCount)
            let totalInputVal = Int(self.txt_OfferAmt.text ?? "1") ?? 1
            self.lbl_TotalAmount.text = "Total: \(String(totalInputVal * totalCount)).00 SR"
        }
    }
    
    @IBAction func btn_Plus(_ sender: UIButton) {
        totalCount = Int(strTotalCount) ?? 0
        print(totalCount)
        if totalCount != staticCountVal {
            totalCount += 1
            strTotalCount = String(totalCount)
            self.lbl_TotalCount.text = String(totalCount)
            let totalInputVal = Int(self.txt_OfferAmt.text ?? "1") ?? 1
            self.lbl_TotalAmount.text = "Total: \(String(totalInputVal * totalCount)).00 SR"
        }
    }
}

extension PopForOffer: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 0 {
            if textField.text != "" {
                print("dd")
                self.lbl_TotalAmount.isHidden = false
                let totalInputVal = Int(self.txt_OfferAmt.text!)
                let totalCount = Int(strTotalCount)
                self.lbl_TotalAmount.text = "Total: \(String(totalInputVal ?? 0 * totalCount!)).00 SR"
            } else {
                print("nothing")
            }
        }
    }
}
