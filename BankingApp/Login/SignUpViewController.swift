//
//  SignUpViewController.swift
//  BankingApp
//
//  Created by God's on 1/24/24.
//

import UIKit
import RealmSwift

class SignUpViewController: UIViewController {
    
    @IBOutlet weak private var nameField: UITextField! {
        didSet {
                let placeholder = NSAttributedString(string: "Name",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
                
            nameField.attributedPlaceholder = placeholder
            }
    }
    @IBOutlet weak private var surnameField: UITextField! {
        didSet {
                let placeholder = NSAttributedString(string: "Surname",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
                
            surnameField.attributedPlaceholder = placeholder
            }
    }
    @IBOutlet weak private var emailField: UITextField! {
        didSet {
                let placeholder = NSAttributedString(string: "Email",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
                
            emailField.attributedPlaceholder = placeholder
            }
    }
    @IBOutlet weak private var ageField: UITextField! {
        didSet {
                let placeholder = NSAttributedString(string: "Age",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
                
            ageField.attributedPlaceholder = placeholder
            }
    }
    @IBOutlet weak private var usernameField: UITextField! {
        didSet {
                let placeholder = NSAttributedString(string: "Username",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
                
            usernameField.attributedPlaceholder = placeholder
            }
    }
    @IBOutlet weak private var passwordField: UITextField! {
        didSet {
                let placeholder = NSAttributedString(string: "Password",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
                
            passwordField.attributedPlaceholder = placeholder
            }
    }
    @IBOutlet weak private var signUpButton: UIButton!
    @IBOutlet private weak var back: UIButton!
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        signInClicked()
    }
    
    let realm = RealmHelper.instance.realm

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
        print(realm?.configuration.fileURL ?? "")
        
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    fileprivate func showCard() {
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func saveUserObjectToRealm(
        name: String,
        surname: String,
        email: String,
        age: Int,
        username: String,
        password: String,
        finished: () -> Void) {
        let user = User()
        user.name = name
        user.surname = surname
        user.email = email
        user.age = age
        user.username = username
        user.password = password
        user.userID = UUID().uuidString
        
        try! realm?.write {
            realm?.add(user)
            finished()
        }
    }
    
    fileprivate func signInClicked() {
       guard  let name = nameField.text,
              let surname = surnameField.text,
              let email = emailField.text,
              let age = ageField.text,
              let username = usernameField.text,
              let password = passwordField.text else {return}
        
        if  username.isEmpty || username.count < 3 ||
            password.isEmpty || password.count < 6 ||
            name.isEmpty || name.count < 3 ||
            surname.isEmpty || surname.count < 6 ||
            email.isEmpty || email.count < 6 ||
            age.isEmpty {
            
            nameField.layer.borderColor = UIColor(named: "error")?.cgColor
            nameField.layer.borderWidth = 1
            
            surnameField.layer.borderColor = UIColor(named: "error")?.cgColor
            surnameField.layer.borderWidth = 1
            
            emailField.layer.borderColor = UIColor(named: "error")?.cgColor
            emailField.layer.borderWidth = 1
            
            ageField.layer.borderColor = UIColor(named: "error")?.cgColor
            ageField.layer.borderWidth = 1
            
            usernameField.layer.borderColor = UIColor(named: "error")?.cgColor
            usernameField.layer.borderWidth = 1
            
            passwordField.layer.borderColor = UIColor(named: "error")?.cgColor
            passwordField.layer.borderWidth = 1
            
            print("error")
        }
        
        else {
            saveUserObjectToRealm(name: name, surname: surname, email: email, age: Int(age) ?? 0, username: username, password: password) { [weak self] in
                guard let self = self else {return}
                navigationController?.popViewController(animated: true)
            
            nameField.layer.borderColor = UIColor(named: "sari")?.cgColor
            surnameField.layer.borderColor = UIColor(named: "sari")?.cgColor
            emailField.layer.borderColor = UIColor(named: "sari")?.cgColor
            ageField.layer.borderColor = UIColor(named: "sari")?.cgColor
            usernameField.layer.borderColor = UIColor(named: "sari")?.cgColor
            passwordField.layer.borderColor = UIColor(named: "sari")?.cgColor
            
            }
            print(name, surname, email, age, username, password)
        }
//        showCard()
    }
    
    fileprivate func setupView() {
        nameField.layer.cornerRadius = 8
        nameField.layer.borderColor = UIColor(named: "sari")?.cgColor
        nameField.layer.borderWidth = 1
        
        surnameField.layer.cornerRadius = 8
        surnameField.layer.borderColor = UIColor(named: "sari")?.cgColor
        surnameField.layer.borderWidth = 1
        
        emailField.layer.cornerRadius = 8
        emailField.layer.borderColor = UIColor(named: "sari")?.cgColor
        emailField.layer.borderWidth = 1
        
        ageField.layer.cornerRadius = 8
        ageField.layer.borderColor = UIColor(named: "sari")?.cgColor
        ageField.layer.borderWidth = 1
        
        usernameField.layer.cornerRadius = 8
        usernameField.layer.borderColor = UIColor(named: "sari")?.cgColor
        usernameField.layer.borderWidth = 1
        
        passwordField.layer.cornerRadius = 8
        passwordField.layer.borderColor = UIColor(named: "sari")?.cgColor
        passwordField.layer.borderWidth = 1
        
        signUpButton.layer.cornerRadius = 8
    }

}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        switch textField {
        case nameField:
            nameField.layer.borderColor = text.count > 2 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case surnameField:
            surnameField.layer.borderColor = text.count > 7 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case emailField:
            emailField.layer.borderColor = text.count > 7 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case ageField:
            ageField.layer.borderColor = text.count > 1 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case usernameField:
            usernameField.layer.borderColor = text.count > 2 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case passwordField:
            passwordField.layer.borderColor = text.count > 7 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        default:
            break
        }
    }
}
