//
//  NotificationVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/08/24.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var notification_TableVw: UITableView!
    
    let viewModel = NotificationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        notification_TableVw.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        bindData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func bindData()
    {
        viewModel.requestToNotification(vC: self, tableView: notification_TableVw)
        viewModel.cloNotification = { [weak self] in
            DispatchQueue.main.async {
                self?.notification_TableVw.reloadData()
            }
        }
    }
}

extension NotificationVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayNotificationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        
        let obj = self.viewModel.arrayNotificationList[indexPath.row]
        if L102Language.currentAppleLanguage() == "ar" {
            cell.lbl_NotificationTitle.text = "\(obj.title_ar ?? "")\n\(obj.message_ar ?? "")"
        } else if L102Language.currentAppleLanguage() == "ur" {
            cell.lbl_NotificationTitle.text = "\(obj.title_ur ?? "")\n\(obj.message_ur ?? "")"
        } else {
            cell.lbl_NotificationTitle.text = "\(obj.title ?? "")\n\(obj.message ?? "")"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = self.viewModel.arrayNotificationList[indexPath.row]
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "OfferDetailVC") as! OfferDetailVC
        vC.viewModel.orderiD =  obj.request_id ?? ""
        self.navigationController?.pushViewController(vC, animated: true)
    }
}
