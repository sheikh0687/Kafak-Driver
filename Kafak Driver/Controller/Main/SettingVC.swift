//
//  SettingVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/08/24.
//

import UIKit

class SettingVC: UIViewController {
    
    let viewModel = SettingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setUpBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setUpBinding()
    {
        viewModel.cloSuccessful = {
            Switcher.updateRootVC()
        }
    }
    
    @IBAction func btn_EditProfile(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Review(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RatingReviewVC") as! RatingReviewVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Wallet(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WalletVC") as! WalletVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_ChangePassword(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_ShareApp(_ sender: UIButton) {
        print("Call Url to share app")
    }
    
    @IBAction func btn_HelpCenter(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Delete(_ sender: UIButton) {
        Utility.showAlertYesNoAction(withTitle: k.appName, message: "Are you sure you want to delete account", delegate: nil, parentViewController: self) { bool in
            if bool {
                self.viewModel.requestToDeleteAccount(vC: self)
            }
        }
    }
    
    @IBAction func btn_Logout(_ sender: UIButton) {
        print("Remove user session")
    }
}
