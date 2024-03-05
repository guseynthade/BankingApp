//
//  LoginViewController.swift
//  BankingApp
//
//  Created by God's on 1/18/24.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak private var helpView: UIView!
    @IBOutlet weak private var helpButton: UIButton!
    @IBOutlet weak private var checkbox: UIButton!
    @IBOutlet weak private var termButton: UIButton!
    @IBOutlet weak private var loginButton: UIButton!
    
    
    @IBAction func helpAction() {
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func checkbox(_ sender: UIButton ) {
        setCheckBox(isSelected: sender.isSelected)
    }
    
    fileprivate func setCheckBox(isSelected: Bool) {
        loginButton.isEnabled = isSelected
        checkbox.isSelected = isSelected
    }
    
    @IBAction func loginAction() {
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func termAction() {
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "TermViewController") as! TermViewController
        vc.delegate = self
        navigationController?.present(vc, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    fileprivate func setupView() {
        loginButton.layer.cornerRadius = 8
        
        helpView.backgroundColor = UIColor(white: 1, alpha: 0.1)
        helpView.layer.cornerRadius = 24
    }
    

}
extension LoginViewController: TermVCProtocol {
    func agreementClicked() {
        print(#function)
        setCheckBox(isSelected: true)
    }
}
