//
//  LastChatViewModel.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 11/03/25.
//

import Foundation

class LastChatViewModel {
    
    var arrayLastChat: [Res_LastChat] = []
    var cloChatReceived: (() -> Void)?
    
    func requestToFetchLastChat(vC: UIViewController, tableView: UITableView) {
        var paramDict: [String: AnyObject] = [:]
        paramDict["receiver_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        
        print(paramDict)
        
        Api.shared.requestToLastConversation(vC, paramDict) { [weak self] responseData in
            guard let self = self else { return }
            if responseData.status == "1" {
                if let res = responseData.result {
                    if res.count > 0 {
                        self.arrayLastChat = res
                        tableView.backgroundView = UIView()
                        tableView.reloadData()
                    }
                }
            } else {
                self.arrayLastChat = []
                tableView.backgroundView = UIView()
                tableView.reloadData()
                Utility.noDataFoundImage(L102Language.currentAppleLanguage() == "en" ? "No Chat" : "لا محادثة", k.emptyString, tableViewOt: tableView, parentViewController: vC, appendImg: nil)
            }
            self.cloChatReceived?()
        }
    }
    
    func setupSearchBar(searchBar: UISearchBar!) {
        searchBar.placeholder = R.string.localizable.search()
        searchBar.barTintColor = UIColor.white
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.searchTextField.textColor = UIColor.black
        
        if let clearButton = searchBar.searchTextField.value(forKey: "_clearButton") as? UIButton {
            clearButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        }
        
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
    }
}
