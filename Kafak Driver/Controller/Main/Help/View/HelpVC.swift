//
//  HelpVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 14/08/24.
//

import UIKit

class HelpVC: UIViewController {

    @IBOutlet weak var txt_Message: UITextView!
    
    let viewModel = ContactUsViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txt_Message.addHint(R.string.localizable.typeSomething())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.writeToUs(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btn_Submit(_ sender: UIButton) {
        if txt_Message.text != "" {
            bindViewModel()
        } else {
            self.alert(alertmessage: R.string.localizable.pleaseEnterTheMessage())
        }
    }
    
    private func bindViewModel() {
        viewModel.contactInfo(vC: self)
        viewModel.cloSuccessfull = {
            Utility.showAlertWithAction(withTitle: k.appName,
                                        message: R.string.localizable.weWillContactYouSoon(),
                                        delegate: nil,
                                        parentViewController: self) { bool in
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
