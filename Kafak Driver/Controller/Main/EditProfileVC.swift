//
//  EditProfileVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 14/08/24.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var txt_FirstName: UITextField!
    @IBOutlet weak var txt_LastName: UITextField!
    @IBOutlet weak var txt_CountryPicker: UITextField!
    @IBOutlet weak var txt_MobileNumber: UITextField!
    @IBOutlet weak var txt_VehicleName: UITextField!
    @IBOutlet weak var txt_VehicleType: UITextField!
    @IBOutlet weak var txt_DrivingExperience: UITextView!
    @IBOutlet weak var txt_DeliveryType: UITextField!
    
    let viewModel = EditProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configureCountryPicker(for: self.txt_CountryPicker)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: "Edit Profile", CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btn_Submit(_ sender: UIButton) {
        
    }
}
