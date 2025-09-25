//
//  WithdrawRequestViewModel.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/04/25.
//

import Foundation

class WithdrawRequestViewModel {
    
    var cloSuccess: (() -> Void)?
    var arrayWithdrawRequest: [Res_WithdrawAmountRequest] = []
    
    func requestWithdrawAmount(vC: UIViewController, tableView: UITableView) {
        Api.shared.requestToCheckWithrawAmountReq(vC) { responseData in
            if responseData.status == "1" {
                if let res = responseData.result {
                    if res.count > 0 {
                        self.arrayWithdrawRequest = res
                        tableView.backgroundView = UIView()
                        tableView.reloadData()
                    }
                }
            } else {
                self.arrayWithdrawRequest = []
                tableView.backgroundView = UIView()
                tableView.reloadData()
                Utility.noDataFoundImage(R.string.localizable.youHave0Notification(), k.emptyString, tableViewOt: tableView, parentViewController: vC, appendImg: #imageLiteral(resourceName: "empty_notification"))            }
            self.cloSuccess?()
        }
    }
}
