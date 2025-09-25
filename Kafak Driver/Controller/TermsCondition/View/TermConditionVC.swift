//
//  TermConditionVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 21/04/25.
//

import UIKit

class TermConditionVC: UIViewController {
    
    @IBOutlet weak var lbl_Privacy: UILabel!
    
    let viewModel = TermConditionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        if viewModel.strType == "TermsCondition" {
            setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.termOfServices(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
        } else {
            setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.privacyPolicy(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func bindData() {
        viewModel.fetchUserPages(vC: self)
        viewModel.cloSuccess = { [self] in
            let html = self.viewModel.strDescription
            if let attributedString = html.htmlAttributedString3 {
                self.lbl_Privacy.attributedText = attributedString
            }
        }
    }
}
