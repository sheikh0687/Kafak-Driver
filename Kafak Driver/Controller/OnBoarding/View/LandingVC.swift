//
//  LandingVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/08/24.
//

import UIKit

class LandingVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnNextOt: UIButton!
    @IBOutlet weak var lbl_Language: UILabel!
    
    let identifier = "LandingCell"

    var arrayOfBanners: [Res_OnBoarding] = []
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        self.navigationController?.navigationBar.isHidden = true
        if L102Language.currentAppleLanguage() == "en" {
            self.lbl_Language.text = "English"
            self.lbl_Language.textAlignment = .left
        } else {
            self.lbl_Language.text = "الإنجليزية"
            self.lbl_Language.textAlignment = .right
        }
        bingdataWithAdmin()
    }

    @IBAction func btnNext(_ sender: UIButton) {
        let vC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeVC
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func btn_DropLanguage(_ sender: UIButton) {
        viewModel.configureDropDown(sender: sender)
    }

}

extension LandingVC {
    
    func bingdataWithAdmin() {
        Api.shared.requestToWelcomeBanner(self) { responseData in
            if responseData.count > 0 {
                self.arrayOfBanners = responseData
            } else {
                self.arrayOfBanners = []
            }
            self.collectionView.reloadData()
        }
    }
}

extension LandingVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayOfBanners.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LandingCell", for: indexPath) as! LandingCell
        let obj = self.arrayOfBanners[indexPath.row]
        
        if L102Language.currentAppleLanguage() == "en" {
            cell.lbl_Main.text = obj.title ?? ""
            cell.lbl_Sub.text = obj.description ?? ""
        } else {
            cell.lbl_Main.text = obj.title_ar ?? ""
            cell.lbl_Sub.text = obj.description_ar ?? ""
        }
        
        if Router.BASE_IMAGE_URL != obj.image {
            Utility.setImageWithSDWebImage(obj.image ?? "", cell.img)
        } else {
            cell.img.image = R.image.slide_1()
        }

        return cell
    }
}

extension LandingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
}
