//
//  EditProfileVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 14/08/24.
//

import UIKit
import DropDown

class EditProfileVC: UIViewController {
    
    @IBOutlet weak var btn_ProfileImg: UIButton!
    @IBOutlet weak var btn_FrontImg: UIButton!
    @IBOutlet weak var btn_RearImg: UIButton!
    @IBOutlet weak var btn_SideImg: UIButton!
    
    @IBOutlet weak var txt_FirstName: UITextField!
    @IBOutlet weak var txt_LastName: UITextField!
    @IBOutlet weak var txt_CountryPicker: UITextField!
    
    @IBOutlet weak var btnCountryPickerOt: UIButton!
    
    @IBOutlet weak var txt_MobileNumber: UITextField!
    @IBOutlet weak var txt_VehicleName: UITextField!
    @IBOutlet weak var txt_DrivingExperience: UITextView!
    @IBOutlet weak var txt_DistanceRange: UITextField!
    @IBOutlet weak var txt_AddressPicker: UITextView!
    @IBOutlet weak var txt_AddressPickerHeight: NSLayoutConstraint!
    
    @IBOutlet weak var btn_VehicleTypeOt: UIButton!
    @IBOutlet weak var btn_DeliveryTypeOt: UIButton!
    @IBOutlet weak var btn_ServiceTypeOt: UIButton!
    @IBOutlet weak var btn_ServiceOt: UIButton!
    
    let viewModel = EditProfileViewModel()
    var strCCode:String! = "966"
    var isFrom:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCountryPickerOt.setTitle("+\(k.userDefault.value(forKey: k.session.mobileCode) as? String ?? "966")", for: .normal)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addressPicker))
        txt_AddressPicker.isUserInteractionEnabled = true
        txt_AddressPicker.addGestureRecognizer(tapGesture)
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.editProfile(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
        fetchDriverProfile()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchAllServices()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func leftClick() {
        if isFrom == "Register" {
            Switcher.updateRootVC()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func addressPicker()
    {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "AddressPickerVC") as! AddressPickerVC
        vC.locationPickedBlock = { (addressCordinate, latVal, lonVal, addressVal) in
            //            let height_location = Utility.autoresizeTextView(addressVal, font: UIFont(name: "Cairo-Regular", size: 14)!, width: self.txt_AddressPicker.frame.width)
            //
            //            if height_location > 17 {
            //                self.txt_AddressPickerHeight.constant = height_location + 15
            //            } else {
            //                self.txt_AddressPickerHeight.constant = height_location + 18
            //            }
            self.txt_AddressPicker.text = addressVal
            self.viewModel.strLat = String(latVal)
            self.viewModel.strLong = String(lonVal)
        }
        self.present(vC, animated: true, completion: nil)
    }
    
    private func fetchDriverProfile()
    {
        viewModel.fetchDriverProfile(vC: self)
        viewModel.cloSuccessfull = { [] in
            DispatchQueue.main.async { [self] in
                let obj = self.viewModel.arrayProfileDetails
                self.txt_AddressPicker.text = obj?.address ?? ""
                self.txt_DistanceRange.text = obj?.distance_range ?? ""
                self.txt_FirstName.text = obj?.first_name ?? ""
                self.txt_LastName.text = obj?.last_name ?? ""
                self.txt_MobileNumber.text = obj?.mobile ?? ""
                self.txt_VehicleName.text = obj?.vehicle_name ?? ""
                self.txt_DrivingExperience.text = obj?.driver_experience ?? ""
                
                self.btn_VehicleTypeOt.setTitle(obj?.vehicle_type ?? "", for: .normal)
                
                self.btn_DeliveryTypeOt.setTitle(viewModel.deliveryType, for: .normal)
                
                self.btn_ServiceOt.setTitle(L102Language.currentAppleLanguage() == "en" ? obj?.sub_service_name ?? "" : obj?.sub_service_name_ar ?? "", for: .normal)
                
                if Router.BASE_IMAGE_URL != obj?.image {
                    Utility.downloadImageBySDWebImage(obj?.image ?? "") { image, error in
                        if image != nil {
                            self.btn_ProfileImg.setImage(image, for: .normal)
                        } else {
                            self.btn_ProfileImg.setImage(R.image.profile_ic(), for: .normal)
                        }
                    }
                } else {
                    self.btn_ProfileImg.setImage(R.image.profile_ic(), for: .normal)
                }
                
                if Router.BASE_IMAGE_URL != obj?.front_view {
                    Utility.downloadImageBySDWebImage(obj?.front_view ?? "") { image, error in
                        if image != nil {
                            self.btn_FrontImg.setImage(image, for: .normal)
                        } else {
                            self.btn_FrontImg.setImage(R.image.no_Image_Available(), for: .normal)
                        }
                    }
                } else {
                    self.btn_FrontImg.setImage(R.image.no_Image_Available(), for: .normal)
                }
                
                if Router.BASE_IMAGE_URL != obj?.rear_view {
                    Utility.downloadImageBySDWebImage(obj?.rear_view ?? "") { image, error in
                        if image != nil {
                            self.btn_RearImg.setImage(image, for: .normal)
                        } else {
                            self.btn_RearImg.setImage(R.image.no_Image_Available(), for: .normal)
                        }
                    }
                } else {
                    self.btn_RearImg.setImage(R.image.no_Image_Available(), for: .normal)
                }
                
                if Router.BASE_IMAGE_URL != obj?.side_view {
                    Utility.downloadImageBySDWebImage(obj?.side_view ?? "") { image, error in
                        if image != nil {
                            self.btn_SideImg.setImage(image, for: .normal)
                        } else {
                            self.btn_SideImg.setImage(R.image.no_Image_Available(), for: .normal)
                        }
                    }
                } else {
                    self.btn_SideImg.setImage(R.image.no_Image_Available(), for: .normal)
                }
            }
        }
    }
    
    private func fetchAllServices()
    {
        viewModel.fetchAllServices(vC: self)
        viewModel.cloServices = { [weak self] in
            guard let self else { return }
            print("Data Fetched Successfully!")
            self.viewModel.configureDropDown(sender: self.btn_ServiceTypeOt)
            
            for val in self.viewModel.arrayAllServices {
                if self.viewModel.serviceiD == val.id {
                    self.btn_ServiceTypeOt.setTitle(L102Language.currentAppleLanguage() == "en" ? val.category_name ?? "" : val.category_name_ar ?? "", for: .normal)
                }
            }
            
            if let index = self.viewModel.arrayAllServices.firstIndex(where: { $0.id == self.viewModel.serviceiD }) {
                self.viewModel.dropDown.selectRow(index)
            }
        }
    }
    
    @IBAction func btn_CountryPicker(_ sender: UIButton)
    {
        print("Country Picker Tapped!!")
        let countryListVC = CountryList()
        countryListVC.delegate = self
        let navController = UINavigationController(rootViewController: countryListVC)
        self.present(navController, animated: true, completion: nil)
    }
    
    @IBAction func btn_VehicleType(_ sender: UIButton) {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "VehicleTypeVC") as! VehicleTypeVC
        vC.strHeadline = R.string.localizable.selectVehicleType()
        
        vC.cloVehicleDt = { striD, strName, strVehileTitle in
            sender.setTitle(strVehileTitle, for: .normal)
            self.viewModel.vehicleType = strName
            self.viewModel.vehicleiD = striD
        }
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func btn_SelectService(_ sender: UIButton) {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "VehicleTypeVC") as! VehicleTypeVC
        vC.strHeadline = R.string.localizable.selectService()
        vC.viewModel.catiD = viewModel.serviceiD
        
        vC.cloVehicleDt = { striD, strName, strVehileTitle in
            sender.setTitle(strVehileTitle, for: .normal)
            if L102Language.currentAppleLanguage() == "en" {
                self.viewModel.subServices = strVehileTitle
            } else if L102Language.currentAppleLanguage() == "ar" {
                self.viewModel.subServiceAr = strVehileTitle
            } else {
                self.viewModel.subServiceUr = strVehileTitle
            }
            self.viewModel.subServicesiD = striD
        }
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func btn_DeliveryType(_ sender: UIButton) {
        viewModel.configureDeliveryDrop(sender: self.btn_DeliveryTypeOt)
        viewModel.deliveryTypeDrop.show()
    }
    
    @IBAction func btn_ServiceType(_ sender: UIButton) {
        viewModel.dropDown.show()
    }
    
    @IBAction func btn_Profile(_ sender: UIButton) {
        viewModel.configureProfileImg(vC: self, sender: sender)
    }
    
    @IBAction func btn_FrontVw(_ sender: UIButton) {
        viewModel.configureFrontVwImg(vC: self, sender: sender)
    }
    
    @IBAction func btn_RearImg(_ sender: UIButton) {
        viewModel.configureRearVwImg(vC: self, sender: sender)
    }
    
    @IBAction func btn_SideImg(_ sender: UIButton) {
        viewModel.configureSideVwImg(vC: self, sender: sender)
    }
    
    private func setupBindings() {
        viewModel.showErrorMessage = { [weak self] in
            if let errorMessage = self?.viewModel.errorMessage {
                Utility.showAlertMessage(withTitle: k.appName, message: errorMessage, delegate: nil, parentViewController: self!)
            }
        }
        
        viewModel.cloProfileUpdated = { [weak self] in
            guard let self else { return }
            Utility.showAlertWithAction(withTitle: k.appName, message: R.string.localizable.profileUpdatedSuccessfully(), delegate: nil, parentViewController: self) { bool in
                if self.isFrom == "Register" {
                    Switcher.updateRootVC()
                } else {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    @IBAction func btn_Submit(_ sender: UIButton) {
        viewModel.phoneKey = strCCode
        viewModel.firtName = self.txt_FirstName.text ?? ""
        viewModel.lastName = self.txt_LastName.text ?? ""
        viewModel.mobile = self.txt_MobileNumber.text ?? ""
        viewModel.vehicleName = self.txt_VehicleName.text ?? ""
        viewModel.drivingExperience = self.txt_DrivingExperience.text ?? ""
        viewModel.distanceRange = self.txt_DistanceRange.text ?? ""
        viewModel.strAddress = self.txt_AddressPicker.text ?? ""
        viewModel.updateDriverProfile(vC: self)
    }
}

extension EditProfileVC: CountryListDelegate {
    func selectedCountry(country: Country) {
        strCCode = "\(country.phoneExtension)"
        print(strCCode!)
        let displayName = country.name ?? country.countryCode
        btnCountryPickerOt.setTitle("+\(strCCode!)", for: .normal)
        
        k.userDefault.set(strCCode!, forKey: k.session.mobileCode)
        print("Selected country:", displayName, strCCode!)
    }
}
