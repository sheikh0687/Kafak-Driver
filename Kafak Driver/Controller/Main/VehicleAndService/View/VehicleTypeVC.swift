//
//  VehicleTypeVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 21/02/25.
//

import UIKit


class VehicleTypeVC: UIViewController {

    @IBOutlet weak var vehicleTypeTableVw: UITableView!
    var strHeadline:String = ""
    
    let viewModel = VehicleAndServiceViewModel()
    var vehicleiD:String = ""
    var vehicleName:String = ""
    var vehicleTittle:String = ""
    
    var cloVehicleDt:((_ striD:String,_ strNameApi:String, _ strNameTitle: String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vehicleTypeTableVw.register(UINib(nibName: "VehicleTypeCell", bundle: nil), forCellReuseIdentifier: "VehicleTypeCell")
        if strHeadline == R.string.localizable.selectVehicleType() {
            fetchVehicleList()
        } else {
            fetchServiceDetails()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: strHeadline, CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func fetchVehicleList() {
        viewModel.requestToFetchVehicleList(vC: self)
        viewModel.cloSuccessfull = { [] in
            DispatchQueue.main.async {
                self.vehicleTypeTableVw.reloadData()
            }
        }
    }
    
    private func fetchServiceDetails()
    {
        viewModel.fetchEquipmentDetails(vC: self)
        viewModel.cloFethcedSuccessfull = { [weak self] in
            DispatchQueue.main.async { [self] in
                self?.vehicleTypeTableVw.reloadData()
            }
        }
    }
    
    @IBAction func btn_Submit(_ sender: UIButton) {
        cloVehicleDt?(vehicleiD, vehicleTittle, vehicleName)
        self.navigationController?.popViewController(animated: true)
    }
}

extension VehicleTypeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if strHeadline == R.string.localizable.selectVehicleType() {
            return self.viewModel.arrayOfVehicelList.count
        } else {
            return self.viewModel.arrayOfServiceDetails.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleTypeCell", for: indexPath) as! VehicleTypeCell
        
        if strHeadline == R.string.localizable.selectVehicleType() {
            let obj = self.viewModel.arrayOfVehicelList[indexPath.row]
            
            switch L102Language.currentAppleLanguage() {
            case "en":
                cell.lbl_VehicleName.text = obj.vehicle ?? ""
            case "ar":
                cell.lbl_VehicleName.text = obj.vehicle_ar ?? ""
            default:
                cell.lbl_VehicleName.text = obj.vehicle_ur ?? ""
            }
            
            if Router.BASE_IMAGE_URL != obj.image ?? "" {
                Utility.setImageWithSDWebImage(obj.image ?? "", cell.vehicelImg)
            } else {
                cell.vehicelImg.image = R.image.no_Image_Available()
            }
            
            cell.img_Checked.image = R.image.check_new_unselected()

        } else {
            let obj = self.viewModel.arrayOfServiceDetails[indexPath.row]
            
            switch L102Language.currentAppleLanguage() {
            case "en":
                cell.lbl_VehicleName.text = obj.item_name ?? ""
            case "ar":
                cell.lbl_VehicleName.text = obj.item_name_ar ?? ""
            default:
                cell.lbl_VehicleName.text = obj.item_name_ur ?? ""
            }

            if let productImg = obj.product_images {
                if productImg.count > 0 {
                    if Router.BASE_IMAGE_URL != productImg.first?.image ?? "" {
                        Utility.setImageWithSDWebImage(productImg.first?.image ?? "", cell.vehicelImg)
                    } else {
                        cell.vehicelImg.image = R.image.no_Image_Available()
                    }
                } else {
                    cell.vehicelImg.image = R.image.no_Image_Available()
                }
            }
            
            cell.img_Checked.image = R.image.check_new_unselected()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! VehicleTypeCell
        
        if strHeadline == R.string.localizable.selectVehicleType() {
            
            let obj = self.viewModel.arrayOfVehicelList[indexPath.row]

            vehicleiD = obj.id ?? ""
            vehicleTittle = obj.vehicle ?? ""
            
            if L102Language.currentAppleLanguage() == "en" {
                vehicleName = obj.vehicle ?? ""
            } else if L102Language.currentAppleLanguage() == "ar" {
                vehicleName = obj.vehicle_ar ?? ""
            } else {
                vehicleName = obj.vehicle_ur ?? ""
            }
            
            cell.img_Checked.image = R.image.check_new_selected()
            
            let indexPathh = tableView.indexPathsForVisibleRows
            for indexPathOth in indexPathh! {
                if indexPathOth.row != indexPath.row && indexPathOth.section == indexPath.section {
                    let cell = tableView.cellForRow(at: IndexPath(row: indexPathOth.row, section: indexPathOth.section)) as? VehicleTypeCell
                    cell?.img_Checked.image = R.image.check_new_unselected()
                }
            }
        } else {
            let obj = self.viewModel.arrayOfServiceDetails[indexPath.row]

            vehicleiD = obj.id ?? ""
            vehicleTittle = obj.item_name ?? ""
            
            if L102Language.currentAppleLanguage() == "en" {
                vehicleName = obj.item_name ?? ""
            } else if L102Language.currentAppleLanguage() == "ar" {
                vehicleName = obj.item_name_ar ?? ""
            } else {
                vehicleName = obj.item_name_ur ?? ""
            }
            
            cell.img_Checked.image = R.image.check_new_selected()
            
            let indexPathh = tableView.indexPathsForVisibleRows
            for indexPathOth in indexPathh! {
                if indexPathOth.row != indexPath.row && indexPathOth.section == indexPath.section {
                    let cell = tableView.cellForRow(at: IndexPath(row: indexPathOth.row, section: indexPathOth.section)) as? VehicleTypeCell
                    cell?.img_Checked.image = R.image.check_new_unselected()
                }
            }
        }
    }
}
