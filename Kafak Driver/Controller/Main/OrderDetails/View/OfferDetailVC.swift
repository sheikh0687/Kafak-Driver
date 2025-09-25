//
//  OfferDetailVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/08/24.
//

import UIKit
import CoreLocation

class OfferDetailVC: UIViewController {

    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_UserEmail: UILabel!
    @IBOutlet weak var lbl_RequestStatus: UILabel!
    @IBOutlet weak var lbl_RequestDateTime: UILabel!
    @IBOutlet weak var lbl_UserNote: UILabel!
    @IBOutlet weak var lbl_TotalAmount: UILabel!
    @IBOutlet weak var lbl_DeliveryFee: UILabel!
    @IBOutlet weak var lbl_ApplicationFee: UILabel!
    @IBOutlet weak var lbl_RequestNumber: UILabel!
    
    @IBOutlet weak var profile_Img: UIImageView!
    
    @IBOutlet weak var placeOrder_CollectionVw: UICollectionView!
    @IBOutlet weak var cart_TableVw: UITableView!
    @IBOutlet weak var cart_TableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var confirmedVw: UIView!
    @IBOutlet weak var assignedVw: UIView!
    @IBOutlet weak var inProgressVw: UIView!
    @IBOutlet weak var completedVw: UIView!

    @IBOutlet weak var btn_AcceptOt: UIButton!
    @IBOutlet weak var btn_SendOfferOt: UIButton!
    @IBOutlet weak var btn_RejectOt: UIButton!
    @IBOutlet weak var allActionVw: UIStackView!
    
    @IBOutlet weak var btn_CallOt: UIButton!
    @IBOutlet weak var btn_CHatOt: UIButton!
    @IBOutlet weak var contactVw: UIView!
    @IBOutlet weak var lbl_MessageCount: UILabel!
    @IBOutlet weak var notificationVw: UIView!
    
    
    let viewModel = OrderDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.placeOrder_CollectionVw.register(UINib(nibName: "PlaceOrderImgCell", bundle: nil), forCellWithReuseIdentifier: "PlaceOrderImgCell")
        self.cart_TableVw.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: "CartCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.makeAnOffer(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
        fetchOrderDetails()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btn_Chat(_ sender: Any) {
        let vC = Kstoryboard.instantiateViewController(withIdentifier: "DriverChatVC") as! DriverChatVC
        vC.viewModel.receiver_Id = viewModel.strUserOrderiD
        vC.viewModel.request_Id = viewModel.orderiD
        vC.strUserName = viewModel.strUserName
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func btn_Call(_ sender: Any) {
        Utility.callNumber(phoneNumber: viewModel.strUserNum)
    }
    
    @IBAction func btn_SeeMap(_ sender: UIButton) {
        Utility.openGoogleMaps(latitude: Double(viewModel.strLat) ?? 0.0, longitude: Double(viewModel.strLon) ?? 0.0)
    }
    
    public func fetchOrderDetails()
    {
        viewModel.requestToFetchOrderDetail(vC: self)
        viewModel.cloSuccessfull = { [] in
            DispatchQueue.main.async { [self] in
                lbl_UserName.text = viewModel.strUserName
                lbl_UserEmail.text = viewModel.strUserEmail
                lbl_RequestStatus.text = viewModel.strRequestStatus
                lbl_RequestDateTime.text = viewModel.strRequestDateTime
                lbl_UserNote.text = viewModel.strCustomerNote
                lbl_TotalAmount.text = "\(viewModel.strTotalAmount) SR"
                lbl_DeliveryFee.text = "\(viewModel.strDeliveryCost) SR"
                lbl_ApplicationFee.text = "\(viewModel.strApplicationFee) SR"
                lbl_RequestNumber.text = "#\(viewModel.orderiD)"
                
                if Router.BASE_IMAGE_URL != viewModel.strImgUrl {
                    Utility.setImageWithSDWebImage(viewModel.strImgUrl, self.profile_Img)
                } else {
                    self.profile_Img.image = R.image.profile_ic()
                }
                
                if viewModel.isDirectAccept == "Yes" {
                    self.btn_SendOfferOt.isHidden = true
                    self.btn_RejectOt.isHidden = false
                    self.btn_AcceptOt.isHidden = false
                }
                
                if viewModel.isChatOpen == "Yes" {
                    self.btn_CHatOt.isHidden = false
                } else {
                    self.btn_CHatOt.isHidden = true
                }
                
                if viewModel.isCallOpen == "Yes" {
                    self.btn_CallOt.isHidden = false
                } else {
                    self.btn_CallOt.isHidden = true
                }
                
                if viewModel.isChatOpen == "No" && viewModel.isCallOpen == "No" {
                    self.contactVw.isHidden = true
                }
                
                if viewModel.messageCount != "0" {
                    self.notificationVw.isHidden = false
                    self.lbl_MessageCount.text = viewModel.messageCount
                } else {
                    self.notificationVw.isHidden = true
                }

                switch viewModel.strRequestStatus {
                case "Pending":
                    self.confirmedVw.backgroundColor = R.color.darkBlue()
                    self.assignedVw.backgroundColor = .separator
                    self.inProgressVw.backgroundColor = .separator
                    self.completedVw.backgroundColor = .separator
                    self.contactVw.isHidden = true
                    
                    if viewModel.strPlaceBidStatus == "Yes" {
                        self.lbl_RequestStatus.text = "\("Request Status"): \(viewModel.strRequestStatus) (\(R.string.localizable.awaitingCustomerApproval()))"
                        self.btn_AcceptOt.isHidden = true
                        self.btn_SendOfferOt.setTitle(R.string.localizable.updateOffer(), for: .normal)
                    }

                case "Cancel":
                    self.confirmedVw.backgroundColor = R.color.darkBlue()
                    self.assignedVw.backgroundColor = .separator
                    self.inProgressVw.backgroundColor = .separator
                    self.completedVw.backgroundColor = .separator
                    self.contactVw.isHidden = true
                case "Accept":
                    self.confirmedVw.backgroundColor = .separator
                    self.assignedVw.backgroundColor = R.color.darkBlue()
                    self.inProgressVw.backgroundColor = .separator
                    self.completedVw.backgroundColor = .separator
                    
                    self.btn_AcceptOt.isHidden = false
                    self.btn_AcceptOt.setTitle(R.string.localizable.startOrder(), for: .normal)
                    self.btn_RejectOt.isHidden = true
                    self.btn_SendOfferOt.isHidden = true

                case "Picked":
                    self.confirmedVw.backgroundColor = .separator
                    self.assignedVw.backgroundColor = .separator
                    self.inProgressVw.backgroundColor = R.color.darkBlue()
                    self.completedVw.backgroundColor = .separator
                    
                    self.btn_AcceptOt.isHidden = false
                    self.btn_AcceptOt.setTitle(R.string.localizable.markAsArrived(), for: .normal)
                    self.btn_RejectOt.isHidden = true
                    self.btn_SendOfferOt.isHidden = true
                    
                case "Arrived":
                    self.confirmedVw.backgroundColor = .separator
                    self.assignedVw.backgroundColor = .separator
                    self.inProgressVw.backgroundColor = R.color.darkBlue()
                    self.completedVw.backgroundColor = .separator
                    
                    self.btn_AcceptOt.isHidden = false
                    self.btn_AcceptOt.setTitle(R.string.localizable.markAsDelivered(), for: .normal)
                    self.btn_RejectOt.isHidden = true
                    self.btn_SendOfferOt.isHidden = true
                    
                default:
                    self.confirmedVw.backgroundColor = .separator
                    self.assignedVw.backgroundColor = .separator
                    self.inProgressVw.backgroundColor = .separator
                    self.completedVw.backgroundColor = R.color.darkBlue()
                    self.contactVw.isHidden = true
                    self.allActionVw.isHidden = true
                    let vC = Kstoryboard.instantiateViewController(withIdentifier: "GiveRatingVC") as! GiveRatingVC
                    vC.strAmountDetail = viewModel.strTotalAmount
                    vC.viewModel.useriD = viewModel.strUserOrderiD
                    vC.viewModel.req_Id = viewModel.orderiD
                    vC.serviceImage = viewModel.strServiceImg
                    self.navigationController?.pushViewController(vC, animated: true)
                }
                
                if viewModel.arrayOfPlaceOrderImage.count > 0 {
                    self.placeOrder_CollectionVw.reloadData()
                } else {
                    self.placeOrder_CollectionVw.isHidden = true
                }
                self.cart_TableHeight.constant = CGFloat(self.viewModel.arrayOfCartDetail.count * 120)
                self.cart_TableVw.reloadData()
            }
        }
    }
    
    @IBAction func btn_Accept(_ sender: UIButton) {
        switch viewModel.strRequestStatus {
        case "Pending":
            viewModel.requestToPlaceBid(vC: self, strAmount: self.viewModel.strTotalAmount)
            viewModel.cloPlaceBidSuccessfully = { [weak self] in
                self?.fetchOrderDetails()
            }
        case "Accept":
            print("Call Api with Picked status")
            viewModel.requestToChangeStatus(vC: self, strStatus: "Picked")
            viewModel.cloChangeStatusSuccessfully = { [] in
                self.fetchOrderDetails()
            }
        case "Picked":
            print("Call Api with Arrived status")
            viewModel.requestToChangeStatus(vC: self, strStatus: "Arrived")
            viewModel.cloChangeStatusSuccessfully = { [] in
                self.fetchOrderDetails()
            }
        case "Arrived":
            print("Call Api with Delivered status")
            viewModel.requestToChangeStatus(vC: self, strStatus: "Delivered")
            viewModel.cloChangeStatusSuccessfully = { [] in
                self.fetchOrderDetails()
            }
        default: break
//            vC.cloConfirm = { [weak self] in
//                self?.viewModel.requestToUpdatePayment(vC: self!)
//                self?.viewModel.cloPaymentUpdatedSuccessfully = { [weak self] in
//                    self?.fetchOrderDetails()
//                }
//            }
//            
//            vC.cloNavigateToHelp = { [weak self] in
//                let vC = Kstoryboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
//                self?.navigationController?.pushViewController(vC, animated: true)
//            }
        }
    }
    
    @IBAction func btn_SendOffer(_ sender: UIButton) {
        if self.btn_SendOfferOt.title(for: .normal) == "Update Offer" {
            let vC = Kstoryboard.instantiateViewController(withIdentifier: "PopForOffer") as! PopForOffer
            vC.isUpdate = "Yes"
            vC.strBidAmount = viewModel.strPlaceBidAmount
            vC.cloUpdateBid = { strAmount in
                if strAmount != "" {
                    self.viewModel.requestToUpdatePlaceBid(vC: self, strAmount: strAmount)
                    self.viewModel.cloUpdatedSucessfully = { [] in
                        self.fetchOrderDetails()
                    }
                } else {
                    self.viewModel.requestToUpdatePlaceBid(vC: self, strAmount: self.viewModel.strPlaceBidAmount)
                    self.viewModel.cloUpdatedSucessfully = { [] in
                        self.fetchOrderDetails()
                    }
                }
            }
            vC.modalTransitionStyle = .crossDissolve
            vC.modalPresentationStyle = .overFullScreen
            self.present(vC, animated: true, completion: nil)
        } else {
            let vC = Kstoryboard.instantiateViewController(withIdentifier: "PopForOffer") as! PopForOffer
            vC.cloUpdateBid = { strAmount in
                self.viewModel.requestToPlaceBid(vC: self,strAmount: strAmount)
                self.viewModel.cloPlaceBidSuccessfully = { [] in
                    self.fetchOrderDetails()
                }
            }
            vC.modalTransitionStyle = .crossDissolve
            vC.modalPresentationStyle = .overFullScreen
            self.present(vC, animated: true, completion: nil)
        }
    }
 
    @IBAction func btn_Reject(_ sender: UIButton) {
        self.viewModel.requestToAddRejectReq(vC: self)
        self.viewModel.cloRejectBidSuccessfully = {
            Utility.showAlertWithAction(withTitle: k.appName, message: R.string.localizable.bidRejectedSuccessfully(), delegate: nil, parentViewController: self) { bool in
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension OfferDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayOfCartDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        let obj = viewModel.arrayOfCartDetail[indexPath.row]
        cell.lbl_CartItemName.text = "\(obj.product_name ?? "")"
        cell.lbl_CartItemQuantity.text = "\(R.string.localizable.quantity()): \(obj.quantity ?? "")"
        cell.lbl_CartItemPrice.text = "\(R.string.localizable.price()): \(obj.product_price ?? "") SR"
        
        if let productImg = obj.product_image {
            if !productImg.contains(Router.BASE_IMAGE_URL) {
                let urlProductImg = Router.BASE_IMAGE_URL + productImg
                Utility.setImageWithSDWebImage(urlProductImg, cell.cartImg)
            } else {
                Utility.setImageWithSDWebImage(productImg, cell.cartImg)
            }
        } else {
            cell.cartImg.image = R.image.no_Image_Available()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension OfferDetailVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.arrayOfPlaceOrderImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceOrderImgCell", for: indexPath) as! PlaceOrderImgCell
        let obj = viewModel.arrayOfPlaceOrderImage[indexPath.row]
        
        if Router.BASE_IMAGE_URL != obj.image {
            Utility.setImageWithSDWebImage(obj.image ?? "", cell.product_Immg)
        } else {
            cell.product_Immg.image = R.image.no_Image_Available()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }
}
