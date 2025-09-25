//
//  SettingVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/08/24.
//

import UIKit

class SettingVC: UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lbl_DriverName: UILabel!
    @IBOutlet weak var lbl_DriverAvailableStatus: UILabel!
    
    @IBOutlet weak var switchOt: UISwitch!
    
    let viewModel = SettingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        fetchDetails()
    }
    
    func fetchDetails()
    {
        viewModel.getUserDetails(vC: self)
        viewModel.cloSuccess = { [weak self] in
            guard let self = self else { return }
            
            self.lbl_DriverName.text = self.viewModel.userName
            
            if Router.BASE_IMAGE_URL != viewModel.userImg {
                Utility.setImageWithSDWebImage(viewModel.userImg, self.profileImg)
            } else {
                self.profileImg.image = R.image.profile_ic()
            }
            
            if viewModel.strDriverStatus == "ONLINE" {
                switchOt.isOn = true
                self.lbl_DriverAvailableStatus.text = R.string.localizable.available()
            } else {
                switchOt.isOn = false
                self.lbl_DriverAvailableStatus.text = R.string.localizable.unAvailable()
            }
        }
    }
    
    @IBAction func switchDriverStatus(_ sender: UISwitch) {
        if sender.isOn {
            changeDriverStatus(strStatus: "ONLINE")
        } else {
            changeDriverStatus(strStatus: "OFFLINE")
        }
    }
    
    private func changeDriverStatus(strStatus: String) {
        viewModel.requestToChangeStatus(vC: self, status: strStatus)
        viewModel.cloChangeStatus = { [weak self] in
            guard let self = self else { return }
            self.fetchDetails()
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
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        vC.userPassword = viewModel.strUserPassword
        self.navigationController?.pushViewController(vC, animated: true)
//        let vC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
//        vC.userPassword = viewModel.strUserPassword
//        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func btn_ChangeLanguage(_ sender: UIButton) {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "LanguageVC") as! LanguageVC
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func btn_ShareApp(_ sender: UIButton) {
        let shareText = "Please install Kaffak app from app store when it will be lived"
        let shareItems: [Any] = [shareText]
        
        let activityVC = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityVC.excludedActivityTypes = [.airDrop, .postToFlickr, .assignToContact, .openInIBooks]
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func btn_PrivacyPolicy(_ sender: UIButton) {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "TermConditionVC") as! TermConditionVC
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func btn_HelpCenter(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminChatVC") as! AdminChatVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Delete(_ sender: UIButton) {
        Utility.showAlertYesNoAction(withTitle: k.appName, message: R.string.localizable.areYouSureYouWantToDeleteYourAccount(), delegate: nil, parentViewController: self) { [weak self] bool in
            guard let self = self else { return }
            if bool {
                self.viewModel.requestToDeleteAccount(vC: self)
                self.viewModel.cloSuccessful = { [] in
                    isLogout = true
                    UserDefaults.standard.removeObject(forKey: k.session.status)
                    UserDefaults.standard.synchronize()
                    Switcher.updateRootVC()
                }
            } else {
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func btn_Logout(_ sender: UIButton) {
        isLogout = true
        UserDefaults.standard.removeObject(forKey: k.session.status)
        Switcher.updateRootVC()
    }
}
