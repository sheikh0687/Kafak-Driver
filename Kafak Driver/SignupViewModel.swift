//
//  SignupViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 20/09/24.
//

import Foundation
import UIKit
import CountryPickerView

class SignupViewModel {
    
    var userFirstName = ""
    var userLastName = ""
    var userEmail = ""
    var userMobile = ""
    var userPassword = ""
    var userAddress = ""
    var userLat = 0.0
    var userLon = 0.0
    var userConfirmPassword = ""
    var strCheck = ""
    
    var registerSuccessful:(() -> Void)?
    var showErrorMessage:(() -> Void)?
    
    var errorMessage: String? {
        didSet {
            self.showErrorMessage?()
        }
    }
    
    weak var cpvTextField: CountryPickerView!
    var phoneKey:String! = ""
    
    func configureCountryPicker(for txt_CountryPicker: UITextField)
    {
        let cp = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 80, height: 14))
        cp.flagImageView.isHidden = true
        txt_CountryPicker.rightView = cp
        txt_CountryPicker.rightViewMode = .always
        txt_CountryPicker.leftView = nil
        txt_CountryPicker.leftViewMode = .never
        cpvTextField = cp
        let countryCode = "US"
        cpvTextField.setCountryByCode(countryCode)
        cp.delegate = self
        [cp].forEach {
            $0?.dataSource = self
        }
        phoneKey = cp.selectedCountry.phoneCode
        cp.countryDetailsLabel.font = UIFont.systemFont(ofSize: 12)
        cp.font = UIFont.systemFont(ofSize: 12)
    }
    
    func navigateToHomeVC(from navigationController: UINavigationController?,viewController: UIViewController) {
        Utility.showAlertWithAction(withTitle: k.appName, message: "Congratulation your account has been created successfully", delegate: nil, parentViewController: viewController) { bool in
            Switcher.updateRootVC()
        }
    }
    
    func returnBack(from navigationController: UINavigationController?) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SignupViewModel {
    
    func isValidInput() -> Bool {
        if userFirstName.isEmpty {
            errorMessage = "Please enter the first name"
            return false
        } else if userLastName.isEmpty {
            errorMessage = "Please enter the last name"
            return false
        } else if userEmail.isEmpty {
            errorMessage = "Please enter the email"
            return false
        } else if userMobile.isEmpty {
            errorMessage = "Please enter the mobile number"
            return false
        } else if userPassword.isEmpty {
            errorMessage = "Please enter the password"
            return false
        } else if userConfirmPassword.isEmpty {
            errorMessage = "Please enter the confirm password"
            return false
        } else if userPassword != userConfirmPassword {
            errorMessage = "Password is not matched"
            return false
        } else if strCheck.isEmpty {
            errorMessage = "Please read the Terms and Conditions for proceed"
            return false
        }
        return true
    }
    
    func requestToRegister(vC: UIViewController) {
        
        guard self.isValidInput() else { return }
        
        var param: [String : AnyObject] = [:]
        param["first_name"] = userFirstName as AnyObject
        param["last_name"] = userLastName as AnyObject
        param["email"] = userEmail as AnyObject
        param["password"] = userPassword as AnyObject
        param["mobile"] = userMobile as AnyObject
        param["mobile_with_code"] = "\(phoneKey ?? "") + \(userMobile)" as AnyObject
        param["address"] = userAddress as AnyObject
        param["lat"] = userLat as AnyObject
        param["lon"] = userLon as AnyObject
        param["type"] = "USER" as AnyObject
        param["register_id"] = k.emptyString as AnyObject
        param["date_time"] = Utility.getCurrentTime() as AnyObject
        param["ios_register_id"] = k.iosRegisterId as AnyObject
        
        print(param)
        
        Api.shared.requestToSignup(vC, param) { responseData in
            let obj = responseData
            k.userDefault.set(true, forKey: k.session.status)
            k.userDefault.set(obj.id, forKey: k.session.userId)
            k.userDefault.set(obj.email, forKey: k.session.userEmail)
            self.registerSuccessful?()
        }
    }
}

extension SignupViewModel: CountryPickerViewDelegate, CountryPickerViewDataSource {
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        self.phoneKey = country.phoneCode
    }
    
    func preferredCountries(in countryPickerView: CountryPickerView) -> [Country] {
        var countries = [Country]()
        ["GB"].forEach { code in
            if let country = countryPickerView.getCountryByCode(code) {
                countries.append(country)
            }
        }
        return countries
    }
    
    func sectionTitleForPreferredCountries(in countryPickerView: CountryPickerView) -> String? {
        return "Preferred title"
    }
    
    func showOnlyPreferredSection(in countryPickerView: CountryPickerView) -> Bool {
        return false
    }
    
    func navigationTitle(in countryPickerView: CountryPickerView) -> String? {
        return "Select a Country"
    }
}

