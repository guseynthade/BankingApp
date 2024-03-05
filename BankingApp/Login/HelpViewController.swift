//
//  HelpViewController.swift
//  BankingApp
//
//  Created by God's on 1/23/24.
//

import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak private var onlineView: UIView!
    @IBOutlet weak private var supportButton: UIButton!
    @IBOutlet weak private var contactsView: UIView!
    @IBOutlet weak private var phoneView: UIView!
    @IBOutlet weak private var emailView: UIView!
    @IBOutlet private weak var close: UIButton!
    
    @IBAction func closeAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    fileprivate func setupView() {
        onlineView.layer.cornerRadius = 16
        
        contactsView.layer.cornerRadius = 16
        
        supportButton.layer.cornerRadius = 20
        
        phoneView.layer.cornerRadius = 8
        phoneView.layer.borderWidth = 1
        phoneView.layer.borderColor = UIColor(named: "white")?.cgColor
        
        emailView.layer.cornerRadius = 8
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor(named: "white")?.cgColor
    }

}
