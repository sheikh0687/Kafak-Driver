//
//  ForgotPasswordVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/08/24.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var txt_Email: UITextField!
    
    let viewModel = ForgotPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: "Forgot Password", CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btn_Send(_ sender: UIButton) {
        self.viewModel.userEmail = txt_Email.text ?? ""
        self.viewModel.requestToResetPassword(vC: self)
    }
    
    private func setUpBinding()
    {
        viewModel.showErrorMessage = { [weak self] in
            if let errorMessage = self?.viewModel.errorMessage {
                Utility.showAlertMessage(withTitle: k.appName, message: errorMessage, delegate: nil, parentViewController: self!)
            }
        }
        
        viewModel.passwordResetSuccess = { [weak self] in
            Utility.showAlertMessage(withTitle: k.appName, message: "Your password has been successfully changed", delegate: nil, parentViewController: self!)
        }
    }
}
