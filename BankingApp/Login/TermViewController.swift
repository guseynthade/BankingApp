//
//  TermViewController.swift
//  BankingApp
//
//  Created by God's on 1/18/24.
//

import UIKit

protocol TermVCProtocol: AnyObject {
    func agreementClicked()
}
class TermViewController: UIViewController {
    
    @IBOutlet weak private var agreeButton: UIButton!
    @IBOutlet weak private var closeButton: UIButton!
    
    @IBAction func agreeAction() {
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.present(vc, animated: true)
        delegate?.agreementClicked()
        agreeClicked?()
        dismiss(animated: true)
//        checkbox.isSelected = true
    }
    
    @IBAction func closeAction() {
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    weak var delegate: TermVCProtocol?
    var agreeClicked: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    fileprivate func setupView() {
        agreeButton.layer.cornerRadius = 8
    }
    


}
