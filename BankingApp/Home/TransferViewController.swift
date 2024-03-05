//
//  TransferViewController.swift
//  BankingApp
//
//  Created by God's on 3/3/24.
//

import UIKit
import RealmSwift

class TransferViewController: UIViewController {
    
    @IBOutlet private weak var fromPan: UITextField! {
        didSet {
            let placeholder = NSAttributedString(string: "Your card number",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
            
            fromPan.attributedPlaceholder = placeholder
        }
    }
    @IBOutlet private weak var toPan: UITextField! {
        didSet {
            let placeholder = NSAttributedString(string: "Card number for transfer",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
            
            toPan.attributedPlaceholder = placeholder
        }
    }
    @IBOutlet private weak var amountField: UITextField! {
        didSet {
            let placeholder = NSAttributedString(string: "Amount",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
            
            amountField.attributedPlaceholder = placeholder
        }
    }
    @IBOutlet private weak var transferButton: UIButton!
    @IBOutlet private weak var closeButton: UIButton!
    
    @IBAction func transferAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    let realm = RealmHelper.instance.realm
    private var transferList: Results<Card>?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func transfer() {
        let tra = transferList
        
        
    }
    
    fileprivate func setupView() {
        fromPan.layer.cornerRadius = 8
        fromPan.layer.borderWidth = 1
        fromPan.layer.borderColor = UIColor(named: "sari")?.cgColor
        
        toPan.layer.cornerRadius = 8
        toPan.layer.borderWidth = 1
        toPan.layer.borderColor = UIColor(named: "sari")?.cgColor
        
        amountField.layer.cornerRadius = 8
        amountField.layer.borderWidth = 1
        amountField.layer.borderColor = UIColor(named: "sari")?.cgColor
        
        transferButton.layer.cornerRadius = 8
    }

}
