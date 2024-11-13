//
//  SignupVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 08/08/24.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var txt_FirstName: UITextField!
    @IBOutlet weak var txt_LastName: UITextField!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_MobileNum: UITextField!
    @IBOutlet weak var txt_CountryPicker: UITextField!
    @IBOutlet weak var txt_Address: UITextField!
    @IBOutlet weak var txt_Password: UITextField!
    @IBOutlet weak var txt_ConfirmPassword: UITextField!
    
    let viewModel = SignupViewModel()
    var strCheck = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configureCountryPicker(for: self.txt_CountryPicker)
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(addressPicker))
        txt_Address.isUserInteractionEnabled = true
        txt_Address.addGestureRecognizer(tapGesture1)
        setUpBinding()
    }
    
    @IBAction func btn_Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addressPicker()
    {
//        let vC = R.storyboard.main().instantiateViewController(withIdentifier: "AddressPickerVC") as! AddressPickerVC
//        vC.locationPickedBlock = { (addressCordinate, latVal, lonVal, addressVal) in
//            self.txt_Address.text = addressVal
//            self.viewModel.userLat = latVal
//            self.viewModel.userLon = lonVal
//        }
//        self.present(vC, animated: true, completion: nil)
    }
    
    @IBAction func btn_Check(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            strCheck = ""
            sender.setImage(R.image.rectangleUncheck(), for: .normal)
        } else {
            strCheck = "Val"
            sender.isSelected = true
            sender.setImage(R.image.rectangleChecked(), for: .normal)
        }
    }
    
    @IBAction func btn_Register(_ sender: UIButton) {
        viewModel.userFirstName = txt_FirstName.text ?? ""
        viewModel.userLastName = txt_LastName.text ?? ""
        viewModel.userEmail = txt_Email.text ?? ""
        viewModel.userMobile = txt_MobileNum.text ?? ""
        viewModel.userPassword = txt_Password.text ?? ""
        viewModel.userConfirmPassword = txt_ConfirmPassword.text ?? ""
        viewModel.strCheck = strCheck
        viewModel.userAddress = txt_Address.text ?? ""
        viewModel.requestToRegister(vC: self)
    }
    
    @IBAction func btn_Login(_ sender: UIButton) {
        viewModel.returnBack(from: self.navigationController)
    }
    
    private func setUpBinding()
    {
        viewModel.showErrorMessage = { [weak self] in
            if let errorMessage = self?.viewModel.errorMessage {
                Utility.showAlertMessage(withTitle: k.appName, message: errorMessage, delegate: nil, parentViewController: self!)
            }
        }
        
        viewModel.registerSuccessful = { [weak self] in
            self?.viewModel.navigateToHomeVC(from: self?.navigationController, viewController: self!)
        }
    }
}
