//
//  LanguageVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 12/03/25.
//

import UIKit

class LanguageVC: UIViewController {
    
    @IBOutlet weak var eng_Img: UIImageView!
    @IBOutlet weak var arb_Img: UIImageView!
    @IBOutlet weak var urdu_Img: UIImageView!
    
    let viewModel = LoginViewModel()
    var selected_Language:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if L102Language.currentAppleLanguage() == "en" {
            self.eng_Img.image = R.image.ic_CheckedCircle_Black()
        } else {
            self.arb_Img.image = R.image.ic_CheckedCircle_Black()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.selectLanguage(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func btn_English(_ sender: UIButton) {
        self.eng_Img.image = R.image.ic_CheckedCircle_Black()
        self.arb_Img.image = R.image.ic_Circle_Black()
        self.urdu_Img.image = R.image.ic_Circle_Black()
        self.selected_Language = "en"
    }
    
    @IBAction func btn_Arabic(_ sender: UIButton) {
        self.arb_Img.image = R.image.ic_CheckedCircle_Black()
        self.eng_Img.image = R.image.ic_Circle_Black()
        self.urdu_Img.image = R.image.ic_Circle_Black()
        self.selected_Language = "ar"
    }
    
//    @IBAction func btn_Urdu(_ sender: UIButton) {
//        self.urdu_Img.image = R.image.ic_CheckedCircle_Black()
//        self.eng_Img.image = R.image.ic_Circle_Black()
//        self.arb_Img.image = R.image.ic_Circle_Black()
//        self.selected_Language = "ur"
//    }

    @IBAction func btn_Save(_ sender: UIButton) {
        switch selected_Language {
        case "en":
            k.userDefault.set(emLang.en.rawValue, forKey: k.session.language)
            L102Language.setAppleLAnguageTo(lang: "en")
            let _: UIView.AnimationOptions = .transitionFlipFromLeft
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.viewModel.updateLanguage(vC: self, appLan: "en")
            self.viewModel.cloUpdateLanguage = { [] in
                Switcher.updateRootVC()
            }

        case "ar":
            k.userDefault.set(emLang.ar.rawValue, forKey: k.session.language)
            L102Language.setAppleLAnguageTo(lang: "ar")
            let _: UIView.AnimationOptions = .transitionFlipFromRight
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.viewModel.updateLanguage(vC: self, appLan: selected_Language)
            self.viewModel.cloUpdateLanguage = { [] in
                Switcher.updateRootVC()
            }
        default:
            print("")
        }
    }
}
