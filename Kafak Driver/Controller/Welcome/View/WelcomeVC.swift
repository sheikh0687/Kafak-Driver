//
//  WelcomeVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/08/24.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn_Login(_ sender: UIButton) {
        let vc = Kstoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Signup(_ sender: UIButton) {
        let vc = Kstoryboard.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
