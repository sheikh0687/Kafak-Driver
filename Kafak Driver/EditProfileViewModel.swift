//
//  EditProfileViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/09/24.
//

import Foundation
import CountryPickerView

class EditProfileViewModel {
    
    var firtName:String = ""
    var lastName: String = ""
    var mobile:String = ""
    var vehicleType: String = ""
    var vehicleName: String = ""
    var drivingExperience: String = ""
    var deliveryType: String = ""
    var cloSuccessfull:(() -> Void)?
    
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
    
}

extension EditProfileViewModel {
    
    func isValidInput() -> Bool {
        if firtName.isEmpty {
            errorMessage = "Please enter the first name"
            return false
        } else if lastName.isEmpty {
            errorMessage = "Please enter the last name"
            return false
        } else if vehicleType.isEmpty {
            errorMessage = "Please select the vehicle type"
            return false
        } else if mobile.isEmpty {
            errorMessage = "Please enter the mobile number"
            return false
        } else if vehicleName.isEmpty {
            errorMessage = "Please enter the vehicle name"
            return false
        } else if drivingExperience.isEmpty {
            errorMessage = "Please enter your driving experience"
            return false
        } else if deliveryType.isEmpty {
            errorMessage = "Please select the delivery type"
            return false
        }
        return true
    }
    
    
}

extension EditProfileViewModel: CountryPickerViewDelegate, CountryPickerViewDataSource {
    
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

