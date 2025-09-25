//
//  DriverChatVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 11/03/25.
//

import UIKit

class DriverChatVC: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    @IBOutlet weak var txt_Msg: UITextView!
    
    var strUserName:String!
    
    var refreshControl = UIRefreshControl()
    let userIdd = k.userDefault.value(forKey: k.session.userId) as! String
    
    let viewModel = DriverChatViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txt_Msg.addHint(R.string.localizable.writeHere())
        if #available(iOS 10.0, *) {
            if #available(iOS 10.0, *) {
                self.tbleView.refreshControl = refreshControl
            } else {
                self.tbleView.addSubview(refreshControl)
            }
            DispatchQueue.main.async {
                self.refreshControl.addTarget(self, action: #selector(self.getChat), for: .valueChanged)
            }
            self.getChat()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: strUserName, CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btnCamera(_ sender: UIButton) {
        viewModel.configureCamera(vC: self)
        viewModel.cloImagePicked = {
            self.txt_Msg.text = ""
            self.bindInsertChat()
        }
    }
    
    @IBAction func actionSend(_ sender: Any) {
        if txt_Msg.text == R.string.localizable.writeHere() || txt_Msg.text.count == 0 {
            self.alert(alertmessage: R.string.localizable.pleaseEnterTheMessage())
        } else {
            bindInsertChat()
        }
    }
    
    @objc func getChat() {
        viewModel.fetchChatDetails(vC: self)
        viewModel.cloChatReceived = {
            self.tbleView.reloadData {
                self.refreshControl.endRefreshing()
                self.scrollToBottom()
            }
        }
    }
    
    func bindInsertChat() {
        viewModel.strTextMessage = self.txt_Msg.text ?? ""
        viewModel.insertUserChat(vC: self)
        viewModel.cloInsertChatSuccess = { [self] in
            self.txt_Msg.text = ""
            self.view.endEditing(true)
            self.getChat()
        }
    }
}


extension DriverChatVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.arrayChatDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let obj = self.viewModel.arrayChatDetails[indexPath.row]
        let strDate = obj.date_time ?? ""
        
        if let imageUrl = obj.chat_image, imageUrl != Router.BASE_IMAGE_URL {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatImageCell", for: indexPath) as! ChatImageCell
            cell.imgLeft.isHidden = true
            cell.imgLeft.isHidden = true
            if let senderId = obj.sender_id, self.userIdd == senderId {
                cell.imgRight.isHidden = false
                Utility.setImageWithSDWebImage(obj.chat_image ?? "", cell.imgRight)
            } else {
                cell.imgLeft.isHidden = false
                Utility.setImageWithSDWebImage(obj.chat_image ?? "", cell.imgLeft)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath) as!
            ConversationCell
            cell.chatRight.isHidden = true
            cell.chatLeft.isHidden = true
            
            if strDate != "0000-00-00 00:00:00" {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let date = formatter.date(from: strDate)
                cell.lblDate.text = formatter.string(from: date!)
            } else {
                cell.lblDate.text = ""
            }
            
            if let senderId = obj.sender_id, self.userIdd == senderId {
                cell.chatRight.cornerRadius = cell.chatRight.frame.height / 2
                cell.chatRight.clipsToBounds = true
                cell.chatRight.isHidden = false
                cell.lblMsgRight.text = obj.chat_message ?? ""
                cell.lblDate.textAlignment = .right
            } else {
                cell.chatLeft.cornerRadius = cell.chatRight.frame.height / 2
                cell.chatLeft.clipsToBounds = true
                cell.chatLeft.isHidden = false
                cell.lblMsgLeft.text = obj.chat_message ?? ""
                cell.lblDate.textAlignment = .left
            }
            return cell
        }
    }
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            if self.viewModel.arrayChatDetails.count > 0 {
                let indexPath = IndexPath(row: self.viewModel.arrayChatDetails.count-1, section: 0)
                self.tbleView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
}
