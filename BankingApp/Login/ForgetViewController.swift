//
//  ForgetViewController.swift
//  BankingApp
//
//  Created by God's on 1/29/24.
//

import UIKit
import RealmSwift

private let user = User()

class ForgetViewController: UIViewController {
    
    @IBOutlet private weak var emailField: UITextField! {
        didSet {
                let placeholder = NSAttributedString(string: "Email",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
                
            emailField.attributedPlaceholder = placeholder
            }
    }
    @IBOutlet private weak var oldPassword: UITextField! {
        didSet {
                let placeholder = NSAttributedString(string: "Old password",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
                
            oldPassword.attributedPlaceholder = placeholder
            }
    }
    @IBOutlet private weak var newPassword: UITextField! {
        didSet {
                let placeholder = NSAttributedString(string: "New password",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
                
            newPassword.attributedPlaceholder = placeholder
            }
    }
    @IBOutlet private weak var change: UIButton!
    @IBOutlet private weak var close: UIButton!
    
    @IBAction func closeAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeAction(_ sender: UIButton) {
        changePassword()
    }
    
    let realm = RealmHelper.instance.realm
    private var userList: Results<User>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
        setupView()

    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    fileprivate func setupView() {
        emailField.layer.borderColor = UIColor(named: "sari")?.cgColor
        emailField.layer.borderWidth = 1
        emailField.layer.cornerRadius = 8
        
        oldPassword.layer.borderColor = UIColor(named: "sari")?.cgColor
        oldPassword.layer.borderWidth = 1
        oldPassword.layer.cornerRadius = 8
        
        newPassword.layer.borderColor = UIColor(named: "sari")?.cgColor
        newPassword.layer.borderWidth = 1
        newPassword.layer.cornerRadius = 8
        
        change.layer.cornerRadius = 8
    }
    
    fileprivate func changePassword() {
        guard  let email = emailField.text,
               let old = oldPassword.text else {return}
        
        if email.isEmpty || email.count < 6 || old.isEmpty || old.count < 6 {
            emailField.layer.borderColor = UIColor(named: "error")?.cgColor
            emailField.layer.borderWidth = 1
            
            oldPassword.layer.borderColor = UIColor(named: "error")?.cgColor
            oldPassword.layer.borderWidth = 1
            
            print("error")
            
        } else {
            emailField.layer.borderColor = UIColor(named: "sari")?.cgColor
            oldPassword.layer.borderColor = UIColor(named: "sari")?.cgColor
            
            checkPassword(email: email, password: old)
        }
        
    }
    
    fileprivate func checkPassword(email: String, password: String) {
        
            if user.email == email {
                if user.password == password {
//                    let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
//                    navigationController?.pushViewController(vc, animated: true)
                    
                    print("giris etdiniz")
                } else {
                    print("Sifreniz duzgun deyil")
                }
            } else {
                print("Bele email yoxdur")
            }
    }
}

extension ForgetViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        switch textField {
        case emailField:
            emailField.layer.borderColor = text.count > 2 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case oldPassword:
            oldPassword.layer.borderColor = text.count > 7 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case newPassword:
            newPassword.layer.borderColor = text.count > 7 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        default:
            break
        }
    }
}
