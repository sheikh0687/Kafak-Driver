//
//  AdminChatVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 07/04/25.
//

import UIKit

class AdminChatVC: UIViewController {

    @IBOutlet weak var lastChatTableVw: UITableView!
    
    let viewModel = AdminChatViewMode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lastChatTableVw.register(UINib(nibName: "AdminContactCell", bundle: nil), forCellReuseIdentifier: "AdminContactCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.query(), CenterImage: "", RightTitle: "", RightImage: "plusnew", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
        fetchAdminChat()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func rightClick() {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    public func fetchAdminChat()
    {
        viewModel.requestToGetAdminChatRequest(vC: self)
        viewModel.cloSuccessfullChat = {
            DispatchQueue.main.async {
                self.lastChatTableVw.reloadData()
            }
        }
    }
}

extension AdminChatVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.arrayChatRequest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminContactCell", for: indexPath) as! AdminContactCell
        let obj = self.viewModel.arrayChatRequest[indexPath.row]
        cell.lbl_UserName.text = obj.name ?? ""
        cell.lbl_Query.text = obj.feedback ?? ""
        cell.lbl_DateTime.text = obj.date_time ?? ""
        
        cell.cloChat = { [weak self] in
            let vC = Kstoryboard.instantiateViewController(withIdentifier: "AdminConvsersationVC") as! AdminConvsersationVC
            vC.viewModel.strRequestId = obj.id ?? ""
            self?.navigationController?.pushViewController(vC, animated: true)
        }
        
        if obj.no_of_message != 0 {
            cell.notificationVw.isHidden = false
            cell.lbl_Count.text = String(obj.no_of_message ?? 0)
        } else {
            cell.notificationVw.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
