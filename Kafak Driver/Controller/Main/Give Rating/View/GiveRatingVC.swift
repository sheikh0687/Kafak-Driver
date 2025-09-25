//
//  GiveRatingVC.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 10/03/25.
//

import UIKit
import Cosmos

class GiveRatingVC: UIViewController {

    @IBOutlet weak var cosmosRating: CosmosView!
    @IBOutlet weak var txt_Review: UITextView!
    @IBOutlet weak var lbl_AmountDetail: UILabel!
    @IBOutlet weak var serviceImages: UIImageView!
    
    let viewModel = AddRatingViewModel()
    var strAmountDetail = ""
    var serviceImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baseUrl = Router.BASE_IMAGE_URL + (serviceImage ?? "")
        Utility.setImageWithSDWebImage(baseUrl, self.serviceImages)

        self.lbl_AmountDetail.text = "\(R.string.localizable.haveYouReceivedTheAmountOf()): \(strAmountDetail) SR?"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.giveRating(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setUpBinding() {
        viewModel.ratingStar = cosmosRating.rating
        viewModel.strReview = txt_Review.text ?? ""
        viewModel.requestToAddRatings(vC: self)
        viewModel.cloRateSuccess = { [weak self] in
            self!.viewModel.requestToUpdatePayment(vC: self!)
            self!.viewModel.cloPaymentUpdatedSuccessfully = { [weak self] message in
                Utility.showAlertWithAction(withTitle: k.appName, message: message, delegate: nil, parentViewController: self!) { bool in
                    Switcher.updateRootVC()
                }
            }
        }
    }
    
    @IBAction func btn_Done(_ sender: UIButton) {
        if cosmosRating.rating.isZero {
            self.alert(alertmessage: R.string.localizable.pleaseAddRate())
        } else {
            setUpBinding()
        }
        
//       else if txt_Review.text == "" {
//           self.alert(alertmessage: R.string.localizable.pleaseEnterTheReview())
//       }
    }
}
