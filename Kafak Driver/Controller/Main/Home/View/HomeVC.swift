//
//  HomeVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/08/24.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var profileImf: UIImageView!
    @IBOutlet weak var request_TableVw: UITableView!
    @IBOutlet weak var btn_NewRequestOt: UIButton!
    @IBOutlet weak var btn_OngoingRequestOt: UIButton!
    @IBOutlet weak var btn_CompletedReqOt: UIButton!
    @IBOutlet weak var switchOt: UISwitch!
    @IBOutlet weak var lbl_ChatCount: UILabel!
    @IBOutlet weak var notificationVw: UIView!
    
    var strType:String = "NewRequest"
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.request_TableVw.register(UINib(nibName: "NewRequestCell", bundle: nil), forCellReuseIdentifier: "NewRequestCell")
        self.request_TableVw.register(UINib(nibName: "RequestCell", bundle: nil), forCellReuseIdentifier: "RequestCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
        fetchDetails()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func fetchDetails()
    {
        viewModel.getDriverDetails(vC: self)
        viewModel.cloSuccess = { [self] in
            
            if viewModel.strMessageCount != "0" {
                notificationVw.isHidden = false
                self.lbl_ChatCount.text = viewModel.strMessageCount
            } else {
                self.notificationVw.isHidden = true
            }
            
            if viewModel.strNotificationCount != "0" {
                if let items = self.tabBarController?.tabBar.items as NSArray? {
                    let tabItem = items.object(at: 1) as! UITabBarItem
                    tabItem.badgeValue = viewModel.strNotificationCount
                }
            } else {
                if let items = self.tabBarController?.tabBar.items as NSArray? {
                    let tabItem = items.object(at: 1) as! UITabBarItem
                    tabItem.badgeValue = nil
                    print("All Count")
                }
            }
            
            if Router.BASE_IMAGE_URL != viewModel.userImg {
                Utility.setImageWithSDWebImage(viewModel.userImg, self.profileImf)
            } else {
                self.profileImf.image = R.image.profile_ic()
            }
            
            if viewModel.strDriverStatus == "ONLINE" {
                switchOt.isOn = true
            } else {
                switchOt.isOn = false
            }
            
            self.fetchOrderList(strType: "Pending")
        }
    }
    
    @IBAction func btn_Switch(_ sender: UISwitch) {
        if sender.isOn {
            changeDriverStatus(strStatus: "ONLINE")
        } else {
            changeDriverStatus(strStatus: "OFFLINE")
        }
    }
    
    private func changeDriverStatus(strStatus: String) {
        viewModel.requestToChangeStatus(vC: self, status: strStatus)
        viewModel.cloChangeStatus = { [self] in
            self.fetchDetails()
        }
    }

    @IBAction func btn_Chat(_ sender: UIButton) {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "LastChatVC") as! LastChatVC
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func btn_AllRequest(_ sender: UIButton) {
        if sender.tag == 0 {
            self.btn_NewRequestOt.backgroundColor = R.color.lightBlue()
            self.btn_NewRequestOt.setTitleColor(.white, for: .normal)
            self.btn_OngoingRequestOt.backgroundColor = .systemGray6
            self.btn_CompletedReqOt.backgroundColor = .systemGray6
            
            self.btn_OngoingRequestOt.setTitleColor(.darkBlue, for: .normal)
            self.btn_CompletedReqOt.setTitleColor(.darkBlue, for: .normal)
            strType = "NewRequest"
            fetchOrderList(strType: "Pending")
        } else if sender.tag == 1 {
            self.btn_OngoingRequestOt.backgroundColor = R.color.lightBlue()
            self.btn_OngoingRequestOt.setTitleColor(.white, for: .normal)
            self.btn_NewRequestOt.backgroundColor = .systemGray6
            self.btn_CompletedReqOt.backgroundColor = .systemGray6
            
            self.btn_NewRequestOt.setTitleColor(.darkBlue, for: .normal)
            self.btn_CompletedReqOt.setTitleColor(.darkBlue, for: .normal)
            strType = "Ongoing"
            fetchOrderList(strType: "Current")
        } else {
            self.btn_CompletedReqOt.backgroundColor = R.color.lightBlue()
            self.btn_CompletedReqOt.setTitleColor(.white, for: .normal)
            self.btn_NewRequestOt.backgroundColor = .systemGray6
            self.btn_OngoingRequestOt.backgroundColor = .systemGray6
            
            self.btn_NewRequestOt.setTitleColor(.darkBlue, for: .normal)
            self.btn_OngoingRequestOt.setTitleColor(.darkBlue, for: .normal)
            strType = "Completed"
            fetchOrderList(strType: "Past")
        }
    }
    
     func fetchOrderList(strType: String) {
        viewModel.requestToFetchOrders(vC: self, strType: strType, request_TableVw)
        viewModel.cloSuccessfull = { [] in
            self.request_TableVw.reloadData()
        }
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayOfOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var obj = self.viewModel.arrayOfOrders[indexPath.row]
        
        if strType == "NewRequest" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewRequestCell", for: indexPath) as! NewRequestCell
            var cartItemQty:Int!
            cell.lbl_UserName.text = "\(obj.user_details?.first_name ?? "") \(obj.user_details?.last_name ?? "")"
            cell.lbl_DateTime.text = obj.date_time ?? ""
            cell.ratingStar.rating = Double(obj.avg_rating ?? 0)
            cell.lbl_RatingCount.text = "\(obj.avg_rating ?? 0)"
            cell.lbl_Quantity.text =  obj.cart_details?[0].quantity ?? ""
            cell.lbl_Request.text = "\(R.string.localizable.requestFor()): \(obj.cart_details?[0].product_name ?? "")"
            cell.lbl_RequestStatus.text = "\("Request Status"): \(obj.status ?? "")"
            cell.lbl_Amount.text = "SR \(obj.total_amount ?? "")"
            cell.lbl_CartCount.text = obj.cart_details?[0].quantity ?? ""
            cell.lbl_Distance.text = "\(obj.distance ?? "") Km"
            cartItemQty = Int(obj.cart_details?[0].quantity ?? "")
            
            if Router.BASE_IMAGE_URL != obj.user_details?.image {
                Utility.setImageWithSDWebImage(obj.user_details?.image ?? "", cell.user_Img)
            } else {
                cell.user_Img.image = R.image.profile_ic()
            }
            
            if let productImg = obj.cart_details?[0].product_details?.product_images {
                if productImg.count > 0 {
                    if Router.BASE_IMAGE_URL != productImg[0].image {
                        Utility.setImageWithSDWebImage(productImg[0].image ?? "", cell.productImg)
                    } else {
                        cell.productImg.image = R.image.no_Image_Available()
                    }
                } else {
                    cell.productImg.image = R.image.no_Image_Available()
                }
            } else {
                cell.productImg.image = R.image.no_Image_Available()
            }
            
            if obj.status == "Pending" {
                cell.viewActions.isHidden = false
                if obj.place_bid_status == "Yes" {
                    cell.lbl_RequestStatus.text = "\("Request Status"): \(obj.status ?? "") (\(R.string.localizable.awaitingCustomerApproval()))"
                    cell.lbl_Amount.text = "SR \(obj.place_bid_offer_amount ?? "")"
                    if obj.direct_accepted == "Yes" {
                        cell.viewActions.isHidden = true
                    } else {
                        cell.viewActions.isHidden = false
                        cell.btn_AcceptOt.isHidden = true
                        cell.btn_Reject.isHidden = true
                        cell.blank1.isHidden = false
                        cell.blank2.isHidden = false
                        cell.btn_SendOfferOt.setTitle(R.string.localizable.updateOffer(), for: .normal)
                    }
                } else {
                    if obj.direct_accepted == "Yes" {
                        cell.btn_SendOfferOt.isHidden = true
                        cell.btn_Reject.isHidden = false
                        cell.btn_AcceptOt.isHidden = false
                    } else {
                        cell.viewActions.isHidden = false
                        cell.btn_AcceptOt.isHidden = false
                        cell.btn_Reject.isHidden = false
                        cell.blank1.isHidden = true
                        cell.blank2.isHidden = true
                        cell.btn_SendOfferOt.setTitle(R.string.localizable.sendOffer(), for: .normal)
                    }
                }
            } else {
                cell.viewActions.isHidden = true
            }
            
            cell.cloSendOffer = { [] in
                if cell.btn_SendOfferOt.title(for: .normal) == "Update Offer" {
                    let vC = Kstoryboard.instantiateViewController(withIdentifier: "PopForOffer") as! PopForOffer
                    vC.isUpdate = "Yes"
                    vC.strBidAmount = obj.place_bid_offer_amount ?? ""
                    print(vC.strBidAmount)
                    vC.strTotalCount = obj.cart_details?[0].quantity ?? ""
                    vC.staticCountVal = Int(obj.cart_details?[0].quantity ?? "") ?? 0
                    vC.cloUpdateBid = { strAmount in
                        if strAmount != "" {
                            self.viewModel.requestToUpdatePlaceBid(vC: self, strPlaceBidiD: obj.place_bid_id ?? "", strAmount: strAmount, itmeQty: String(cartItemQty))
                            self.viewModel.cloUpdatedSucessfully = { [] in
                                self.fetchOrderList(strType: "Pending")
                            }
                        } else {
                            self.viewModel.requestToUpdatePlaceBid(vC: self, strPlaceBidiD: obj.place_bid_id ?? "", strAmount: obj.place_bid_offer_amount ?? "", itmeQty: String(cartItemQty))
                            self.viewModel.cloUpdatedSucessfully = { [] in
                                self.fetchOrderList(strType: "Pending")
                            }
                        }
                    }
                    vC.modalTransitionStyle = .crossDissolve
                    vC.modalPresentationStyle = .overFullScreen
                    self.present(vC, animated: true, completion: nil)
                } else {
                    let vC = Kstoryboard.instantiateViewController(withIdentifier: "PopForOffer") as! PopForOffer
                    vC.strTotalCount = obj.cart_details?[0].quantity ?? ""
                    vC.staticCountVal = Int(obj.cart_details?[0].quantity ?? "") ?? 0
                    vC.cloUpdateBid = { strAmount in
                        self.viewModel.requestToPlaceBid(vC: self, strOrderId: obj.id ?? "", strAmount: strAmount, itmeQty: String(cartItemQty), strUserOrderiD: obj.user_id ?? "")
                        self.viewModel.cloPlaceBidSuccessfully = { [] strBidiD in
                            self.fetchOrderList(strType: "Pending")
                        }
                    }
                    
                    vC.modalTransitionStyle = .crossDissolve
                    vC.modalPresentationStyle = .overFullScreen
                    self.present(vC, animated: true, completion: nil)
                }
            }
            
            cell.cloAccept = { [weak self] in
                guard let self else { return }
                self.viewModel.requestToPlaceBid(vC: self, strOrderId: obj.id ?? "", strAmount: obj.zone_price ?? "", itmeQty: String(cartItemQty), strUserOrderiD: obj.user_id ?? "")
                self.viewModel.cloPlaceBidSuccessfully = { [weak self] strBidiD in
                    guard let self else { return }
                    if obj.direct_accepted == "Yes" {
                        self.viewModel.requestToAcceptofferByUser(vC: self, strOrderiD: obj.id ?? "", strAmount: obj.zone_price ?? "", itemQty: String(cartItemQty), strBidiD: strBidiD, strUseriD: obj.user_id ?? "", strPaymentType: obj.payment_type ?? "", strPaymentMethod: obj.payment_method ?? "")
                        self.viewModel.cloAcceptByUserSuccessfully = { [weak self] in
                            guard let self else { return }
                            self.fetchOrderList(strType: "Pending")
                        }
                    } else {
                        self.fetchOrderList(strType: "Pending")
                    }
                }
            }
            
            cell.cloReject = { [] in
                self.viewModel.requestToAddRejectReq(vC: self, strReqiD: obj.id ?? "")
                self.viewModel.cloRejectBidSuccessfully = { [] in
                    Utility.showAlertWithAction(withTitle: k.appName, message: R.string.localizable.rejectedSuccessfully(), delegate: nil, parentViewController: self) { bool in
                        self.fetchOrderList(strType: "Pending")
                    }
                }
            }
            
            cell.cloPlus = { [] in
                cartItemQty = Int(obj.cart_details?[0].quantity ?? "")
                cartItemQty += 1
                obj.cart_details?[0].quantity = String(cartItemQty)
                cell.lbl_CartCount.text = String(cartItemQty)
            }
            
            cell.cloMinus = { [] in
                cartItemQty = Int(obj.cart_details?[0].quantity ?? "")
                if cartItemQty > 1 {
                    cartItemQty -= 1
                    obj.cart_details?[0].quantity = String(cartItemQty)
                    cell.lbl_CartCount.text = String(cartItemQty)
                }
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! RequestCell
            if strType == "Ongoing" {
                cell.addressVw.isHidden = true
                cell.lbl_Amount.isHidden = false
                cell.btn_ChatOt.isHidden = true
                
                cell.lbl_UserName.text = "\(obj.user_details?.first_name ?? "") \(obj.user_details?.last_name ?? "")"
                cell.lbl_DateTime.text = obj.date_time ?? ""
                cell.lbl_RequestFor.text = "\(R.string.localizable.requestFor()): \(obj.cart_details?[0].product_name ?? "")"
                cell.lbl_RequestStatus.text = "\("Request Status"): \(obj.status ?? "")"
                cell.lbl_Amount.text = "SR \(obj.total_amount ?? "")"
                
                if Router.BASE_IMAGE_URL != obj.user_details?.image {
                    Utility.setImageWithSDWebImage(obj.user_details?.image ?? "", cell.profileImg)
                } else {
                    cell.profileImg.image = R.image.profile_ic()
                }
                
            } else {
                cell.addressVw.isHidden = false
                cell.lbl_Amount.isHidden = true
                cell.btn_ChatOt.isHidden = true
                
                cell.lbl_UserName.text = "\(obj.user_details?.first_name ?? "") \(obj.user_details?.last_name ?? "")"
                cell.lbl_DateTime.text = obj.date_time ?? ""
                cell.lbl_RequestFor.text = "\(R.string.localizable.requestFor()): \(obj.cart_details?[0].product_name ?? "")"
                cell.lbl_RequestStatus.text = "\("Request Status"): \(obj.status ?? "")"
                
                if obj.pickup_address == "" {
                    cell.pickAddressVw.isHidden = true
                } else {
                    cell.pickAddressVw.isHidden = false
                }
                
                cell.lbl_PickupAddress.text = obj.pickup_address ?? ""
                cell.lbl_DropOffAddress.text = obj.address ?? ""
                
                if Router.BASE_IMAGE_URL != obj.user_details?.image {
                    Utility.setImageWithSDWebImage(obj.user_details?.image ?? "", cell.profileImg)
                } else {
                    cell.profileImg.image = R.image.profile_ic()
                }
                
                cell.cloChat = {
                    let vC = Kstoryboard.instantiateViewController(withIdentifier: "DriverChatVC") as! DriverChatVC
                    vC.strUserName = "\(obj.user_details?.first_name ?? "") \(obj.user_details?.last_name ?? "")"
                    vC.viewModel.receiver_Id = obj.user_id ?? ""
                    vC.viewModel.request_Id = obj.id ?? ""
                    self.navigationController?.pushViewController(vC, animated: true)
                }
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = self.viewModel.arrayOfOrders[indexPath.row]
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "OfferDetailVC") as! OfferDetailVC
        vC.viewModel.orderiD = obj.id ?? ""
        vC.viewModel.strPlaceBidiD = obj.place_bid_id ?? ""
        self.navigationController?.pushViewController(vC, animated: true)
    }
}
