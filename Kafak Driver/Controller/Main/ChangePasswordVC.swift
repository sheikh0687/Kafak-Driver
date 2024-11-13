//
//  ChangePasswordVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 14/08/24.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var txt_OldPassword: UITextField!
    @IBOutlet weak var txt_NewPassword: UITextField!
    @IBOutlet weak var txt_ConfirmPassword: UITextField!
    
    let viewModel = ChangePasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: "Change Password", CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btn_Submit(_ sender: UIButton) {
        viewModel.oldPassword = self.txt_OldPassword.text ?? ""
        viewModel.newPassword = self.txt_NewPassword.text ?? ""
        viewModel.confirmPassword = self.txt_ConfirmPassword.text ?? ""
        viewModel.requestToChangePassword(vC: self)
    }
    
    private func setUpBinding()
    {
        viewModel.showErrorMessage = { [weak self] in
            if let errorMessage = self?.viewModel.errorMessage {
                Utility.showAlertMessage(withTitle: k.appName, message: errorMessage, delegate: nil, parentViewController: self!)
            }
        }
        
        viewModel.cloSuccessfull = { [weak self] in
            Utility.showAlertWithAction(withTitle: k.appName, message: "Your password has been successfully changed", delegate: nil, parentViewController: self!) { bool in
                Switcher.updateRootVC()
            }
        }
    }

}
