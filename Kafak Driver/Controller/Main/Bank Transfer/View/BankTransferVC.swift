//
//  BankTransferVC.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 05/04/25.
//

import UIKit
import DropDown

class BankTransferVC: UIViewController {

    @IBOutlet weak var lbl_WalletAmount: UILabel!
    @IBOutlet weak var txt_AccountNumber: UITextField!
    @IBOutlet weak var txt_AccountHolderName: UITextField!
    @IBOutlet weak var txt_IBANNum: UITextField!
    @IBOutlet weak var txt_Amount: UITextField!
    @IBOutlet weak var txt_BankName: UITextField!
    @IBOutlet weak var bankDetailVw: UIStackView!
    @IBOutlet weak var btn_PaymentMethodOt: UIButton!
    @IBOutlet weak var btn_AccountTypeOt: UIButton!

    var strWalletAmount:String = "12.00"
    var strWithdrawAmount:String?
  
    let viewModel = BankWithdrawRequestViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_PaymentMethodOt.setTitle("Bank Account", for: .normal)
        self.btn_AccountTypeOt.setTitle("Individual", for: .normal)
        self.txt_Amount.text = strWithdrawAmount
        self.lbl_WalletAmount.text = "SR \(strWalletAmount) \(R.string.localizable.inYourWallet())\n\(R.string.localizable.youCanSendThisBalanceToAnyBankAccountAtANominalCharge())"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.withdrawalRequest(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
        setupBinding()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupBinding() {
        viewModel.showErrorMessage = { [weak self] in
            if let errorMessage = self?.viewModel.errorMessage {
                Utility.showAlertMessage(withTitle: k.appName, message: errorMessage, delegate: nil, parentViewController: self!)
            }
        }
        
        viewModel.cloWithRequestDone = { [weak self] in
            Utility.showAlertWithAction(withTitle: k.appName, message: R.string.localizable.thanksYouForRequest(), delegate: nil, parentViewController: self!) { bool in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func btn_Proceed(_ sender: UIButton) {
        viewModel.strAccountNum = self.txt_AccountNumber.text ?? ""
        viewModel.strAccountHolderName = self.txt_AccountHolderName.text ?? ""
        viewModel.strIBANNumber = self.txt_IBANNum.text ?? ""
        viewModel.strBankName = self.txt_BankName.text ?? ""
        viewModel.strWithdrawAmount = self.txt_Amount.text ?? ""
        viewModel.requestToWithdraw(vC: self)
    }
    
    @IBAction func btn_SelectPaymentType(_ sender: UIButton) {
        viewModel.configureDropDowns(sender: sender, bankDetailVw: bankDetailVw)
    }
    
    @IBAction func btn_SelectAccountType(_ sender: UIButton) {
        viewModel.configureAccountDropDowns(sender: sender)
    }
}
