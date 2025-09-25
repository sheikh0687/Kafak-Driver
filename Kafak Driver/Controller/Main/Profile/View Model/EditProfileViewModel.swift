//
//  EditProfileViewModel.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 27/09/24.
//

import Foundation
import DropDown

class EditProfileViewModel {
    
    var firtName:String = ""
    var lastName: String = ""
    var mobile:String = ""
    var vehicleName: String = ""
    var vehicleiD:String = ""
    var vehicleType: String = ""
    var drivingExperience: String = ""
    var distanceRange:String = ""
    
    var deliveryType: String = ""
    var deliveryStaticEn: String = ""
    var serviceiD:String = ""
    var serviceName: String = ""
    var serviceStaticEn: String = ""
    var subServicesiD:String = ""
    var subServices:String = ""
    var subServiceAr:String = ""
    var subServiceUr:String = ""
    
    var profileImage: UIImage? = nil
    var frontViewImage: UIImage? = nil
    var rearViewImage: UIImage? = nil
    var sideViewImage: UIImage? = nil
    
    var strProfileImg: String = ""
    var strFrontImg: String = ""
    var strRearImg: String = ""
    var strSideImg: String = ""
    
    var strLat: String = ""
    var strLong: String = ""
    var strAddress: String = ""
    
    var arrayProfileDetails: Res_Profile?
    var cloSuccessfull:(() -> Void)?
    var cloProfileUpdated: (() -> Void)?
    
    var arrayAllServices: [Res_Services] = []
    var cloServices: () -> Void = {}
    
    var dropDown = DropDown()
    var deliveryTypeDrop = DropDown()
    
    var showErrorMessage:(() -> Void)?
    
    var errorMessage: String? {
        didSet {
            self.showErrorMessage?()
        }
    }
    
    var phoneKey:String! = ""
    
    var arrayVehicleList: [Res_VehicleList] = []
    
    func configureDropDown(sender: UIButton)
    {
        var arrayOfServiceiD: [String] = []
        var arrayOfServiceName: [String] = []
        var arrayOfServiceNameAr: [String] = []
        var arrayOfServiceNameUr: [String] = []
        
        for val in arrayAllServices {
            arrayOfServiceiD.append(val.id ?? "")
            arrayOfServiceName.append(val.category_name ?? "")
            arrayOfServiceNameAr.append(val.category_name_ar ?? "")
            arrayOfServiceNameUr.append(val.category_name_ur ?? "")
        }
        
        dropDown.anchorView = sender
        if L102Language.currentAppleLanguage() == "en" {
            dropDown.dataSource = arrayOfServiceName
        } else if L102Language.currentAppleLanguage() == "ar" {
            dropDown.dataSource = arrayOfServiceNameAr
        } else {
            dropDown.dataSource = arrayOfServiceNameUr
        }
        
        dropDown.backgroundColor = .white
        dropDown.setupCornerRadius(8)
        dropDown.separatorColor = .systemBackground
        dropDown.bottomOffset = CGPoint(x: -5, y: 45)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            sender.setTitle(item, for: .normal)
            self.serviceName = item
            self.serviceStaticEn = arrayOfServiceName[index]
            print(self.serviceStaticEn)
            self.serviceiD = arrayOfServiceiD[index]
        }
    }
    
    func configureDeliveryDrop(sender: UIButton)
    {
        deliveryTypeDrop.anchorView = sender
        if L102Language.currentAppleLanguage() == "en" {
            deliveryTypeDrop.dataSource = ["Service Delivery", "Order Delivery"]
        } else if L102Language.currentAppleLanguage() == "ar" {
            deliveryTypeDrop.dataSource = ["توصيل الخدمة", "توصيل الطلب"]
        } else {
            deliveryTypeDrop.dataSource = ["سروس ڈیلیوری", "آرڈر ڈیلیوری"]
        }
        deliveryTypeDrop.backgroundColor = .white
        deliveryTypeDrop.setupCornerRadius(8)
        deliveryTypeDrop.separatorColor = .systemBackground
        deliveryTypeDrop.bottomOffset = CGPoint(x: -5, y: 45)
        deliveryTypeDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            sender.setTitle(item, for: .normal)
            self.deliveryType = item
            if index == 0 {
                self.deliveryStaticEn = "Service Delivery"
            } else {
                self.deliveryStaticEn = "Order Delivery"
            }
        }
    }
    
    func configureProfileImg(vC: UIViewController, sender: UIButton)
    {
        CameraHandler.shared.showActionSheet(vc: vC)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.profileImage = image
            
            sender.contentMode = .scaleToFill
            sender.setImage(image, for: .normal)
        }
    }
    
    func configureFrontVwImg(vC: UIViewController, sender: UIButton)
    {
        CameraHandler.shared.showActionSheet(vc: vC)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.frontViewImage = image
            
            sender.contentMode = .scaleToFill
            sender.setImage(image, for: .normal)
        }
    }
    
    func configureRearVwImg(vC: UIViewController, sender: UIButton)
    {
        CameraHandler.shared.showActionSheet(vc: vC)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.rearViewImage = image
            
            sender.contentMode = .scaleToFill
            sender.setImage(image, for: .normal)
        }
    }
    
    func configureSideVwImg(vC: UIViewController, sender: UIButton)
    {
        CameraHandler.shared.showActionSheet(vc: vC)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.sideViewImage = image
            
            sender.contentMode = .scaleToFill
            sender.setImage(image, for: .normal)
        }
    }
}

extension EditProfileViewModel {
    
    func fetchDriverProfile(vC: UIViewController)
    {
        Api.shared.requestToDriverProfile(vC) { responseData in
            self.arrayProfileDetails = responseData.result
            let obj = responseData.result!
            self.firtName = obj.first_name ?? ""
            self.lastName = obj.last_name ?? ""
            self.mobile = obj.mobile ?? ""
            self.vehicleName = obj.vehicle_name ?? ""
            self.vehicleiD = obj.vehicle_id ?? ""
            self.strAddress = obj.address ?? ""
            self.strLat = obj.lat ?? ""
            self.strLong = obj.lon ?? ""
            self.drivingExperience = obj.driver_experience ?? ""
            
            // MARK: STATIC VALUE
            self.deliveryStaticEn = obj.vehicle_delivery_type ?? ""
            self.vehicleType = obj.vehicle_type ?? ""
            self.serviceStaticEn = obj.service_name ?? ""
            
            if obj.vehicle_delivery_type == "Service Delivery" {
                switch L102Language.currentAppleLanguage() {
                case "en":
                    self.deliveryType = "Service Delivery"
                case "ar":
                    self.deliveryType = "توصيل الخدمة"
                default:
                    self.deliveryType = "سروس ڈیلیوری"
                }
            } else {
                switch L102Language.currentAppleLanguage() {
                case "en":
                    self.deliveryType = "Order Delivery"
                case "ar":
                    self.deliveryType = "توصيل الطلب"
                default:
                    self.deliveryType = "آرڈر ڈیلیوری"
                }
            }
            
            self.strProfileImg = obj.image ?? ""
            self.strRearImg = obj.rear_view ?? ""
            self.strFrontImg = obj.front_view ?? ""
            self.strSideImg = obj.side_view ?? ""
                    
            self.serviceName = obj.service_name ?? ""
            self.subServices = obj.sub_service_name ?? ""
            self.subServiceAr = obj.sub_service_name_ar ?? ""
            self.subServiceUr = obj.sub_service_name_ur ?? ""
            
            self.serviceiD = obj.service_id ?? ""
            self.subServicesiD = obj.sub_service_id ?? ""
            self.cloSuccessfull?()
        }
    }
    
    func fetchAllServices(vC: UIViewController)
    {
        Api.shared.requestToAllService(vC) { responseData in
            if responseData.count > 0 {
                self.arrayAllServices = responseData
            } else {
                self.arrayAllServices = []
            }
            self.cloServices()
        }
    }
    
    func updateDriverProfile(vC: UIViewController) {
        
        guard self.isValidInput() else { return }
        
        var paramDict: [String : String] = [:]
        paramDict["driver_id"] = k.userDefault.value(forKey: k.session.userId) as? String
        paramDict["vehicle_name"] = vehicleName
        paramDict["vehicle_id"] = vehicleiD
        paramDict["vehicle_type"] = vehicleType
        paramDict["driver_experience"] = drivingExperience
        paramDict["vehicle_delivery_type"] = deliveryStaticEn
        
        paramDict["first_name"] = firtName
        paramDict["last_name"] = lastName
        paramDict["mobile"] = mobile
        paramDict["mobile_with_code"] = "\(k.userDefault.value(forKey: k.session.mobileCode) ?? "")\(mobile)"
        paramDict["service_id"] = serviceiD
        paramDict["service_name"] = serviceStaticEn
        paramDict["sub_service_id"] = subServicesiD
        paramDict["sub_service_name"] = subServices
        paramDict["sub_service_name_ar"] = subServiceAr
        paramDict["sub_service_name_ur"] = subServiceUr
        paramDict["distance_range"] = distanceRange
        paramDict["address"] = strAddress
        paramDict["lat"] = strLat
        paramDict["lon"] = strLong
        
        print(paramDict)
        
        var imgParamDict: [String : UIImage] = [:]
        imgParamDict["image"] = profileImage
        imgParamDict["front_view"] = frontViewImage
        imgParamDict["rear_view"] = rearViewImage
        imgParamDict["side_view"] = sideViewImage
        
        print(imgParamDict)
        
        Api.shared.requestToUpdateDriverProfile(vC, paramDict, images: imgParamDict, videos: [:]) { responseData in
            self.cloProfileUpdated?()
        }
    }
    
    func isValidInput() -> Bool {
        if firtName.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterTheFirstName()
            return false
        } else if lastName.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterTheLastName()
            return false
        } else if vehicleType.isEmpty {
            errorMessage = R.string.localizable.pleaseSelectTheVehicleType()
            return false
        } else if mobile.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterTheMobileNumber()
            return false
        } else if !Utility.isValidMobileNumber(mobile) {
            errorMessage = L102Language.currentAppleLanguage() == "en"
                ? "Please enter the valid mobile number"
                : L102Language.currentAppleLanguage() == "ar"
                    ? "الرجاء إدخال رقم جوال صالح"
                    : "براہ کرم درست موبائل نمبر درج کریں"
            return false
        } else if vehicleName.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterTheVehicleName()
            return false
        } else if drivingExperience.isEmpty {
            errorMessage = R.string.localizable.pleaseEnterYourDrivingExperience()
            return false
        } else if deliveryType.isEmpty {
            errorMessage = R.string.localizable.pleaseSelectTheDeliveryType()
            return false
        } else if serviceName.isEmpty {
            errorMessage = R.string.localizable.pleaseSelectTheService()
            return false
        } else if subServicesiD.isEmpty {
            errorMessage = R.string.localizable.pleaseSelectTheSubService()
            return false
        } else if strProfileImg.isEmpty {
            errorMessage = L102Language.currentAppleLanguage() == "en"
                ? "Please select the profile image"
                : L102Language.currentAppleLanguage() == "ar"
                    ? "يرجى تحديد صورة الملف الشخصي"
                    : "براہ کرم پروفائل تصویر منتخب کریں"
            return false

        } else if strFrontImg.isEmpty {
            errorMessage = L102Language.currentAppleLanguage() == "en"
                ? "Please select the front view image"
                : L102Language.currentAppleLanguage() == "ar"
                    ? "يرجى تحديد صورة الواجهة"
                    : "براہ کرم سامنے کا منظر تصویر منتخب کریں"
            return false

        } else if strRearImg.isEmpty {
            errorMessage = L102Language.currentAppleLanguage() == "en"
                ? "Please select the rear view image"
                : L102Language.currentAppleLanguage() == "ar"
                    ? "يرجى تحديد صورة الخلفية"
                    : "براہ کرم پچھلی منظر تصویر منتخب کریں"
            return false

        } else if strSideImg.isEmpty {
            errorMessage = L102Language.currentAppleLanguage() == "en"
                ? "Please select the side view image"
                : L102Language.currentAppleLanguage() == "ar"
                    ? "يرجى تحديد صورة الجانب"
                    : "براہ کرم سائیڈ منظر تصویر منتخب کریں"
            return false
        } else if distanceRange.isEmpty {
            errorMessage = L102Language.currentAppleLanguage() == "en"
                ? "Please enter the distance range"
                : L102Language.currentAppleLanguage() == "ar"
                    ? "يرجى إدخال نطاق المسافة"
                    : "براہ کرم فاصلے کی حد درج کریں"
            return false
        }
        return true
    }
}
