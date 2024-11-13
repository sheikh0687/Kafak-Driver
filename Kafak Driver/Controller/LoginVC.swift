//
//  LoginVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/08/24.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_Password: UITextField!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinding()
    }
    
    @IBAction func btn_Login(_ sender: UIButton) {
        viewModel.userEmail = self.txt_Email.text ?? ""
        viewModel.userPassword = self.txt_Password.text ?? ""
        viewModel.requestToLoginUser(vC: self)
    }
    
    @IBAction func btn_Signup(_ sender: UIButton) {
        viewModel.navigateToSignVC(from: self.navigationController)
    }
    
    @IBAction func btn_ForgotPassword(_ sender: UIButton) {
        viewModel.navigateToForgetPasswordVC(from: self.navigationController)
    }
    
    private func setUpBinding()
    {
        viewModel.showErrorMessage = { [weak self] in
            if let errorMessage = self?.viewModel.errorMessage {
                Utility.showAlertMessage(withTitle: k.appName, message: errorMessage, delegate: nil, parentViewController: self!)
            }
        }
        
        viewModel.loginSuccess = { [weak self] in
            self?.viewModel.navigateToHomeVC(from: self?.navigationController)
        }
    }
}
