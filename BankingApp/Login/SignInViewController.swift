//
//  SignInViewController.swift
//  BankingApp
//
//  Created by God's on 1/18/24.
//

import UIKit
import RealmSwift

class SignInViewController: UIViewController {
    
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
    @IBOutlet weak private var signInButton: UIButton!
    @IBOutlet weak private var signUpButton: UIButton!
    @IBOutlet private weak var forget: UIButton!
    
    @IBAction func forgetAction(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgetViewController") as! ForgetViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        signInClicked()
        
    }
    
    @IBAction func signUpAction() {
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    let realm = RealmHelper.instance.realm
    private var userList: Results<User>?

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserList()
        setupView()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    fileprivate func getUserList() {
        let results = realm?.objects(User.self)
        userList = results
        
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    fileprivate func showCard() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func signInClicked() {
       guard  let username = usernameField.text,
              let password = passwordField.text else {return}
        
        if username.isEmpty || username.count < 3 || password.isEmpty || password.count < 6 {
            usernameField.layer.borderColor = UIColor(named: "error")?.cgColor
            usernameField.layer.borderWidth = 1
            
            passwordField.layer.borderColor = UIColor(named: "error")?.cgColor
            passwordField.layer.borderWidth = 1
            
            print("error")
        } else {
            
            usernameField.layer.borderColor = UIColor(named: "sari")?.cgColor
            passwordField.layer.borderColor = UIColor(named: "sari")?.cgColor
            
            checkUser(username: username, password: password)
            
//            showCard()
            
        }
        
    }
    
    fileprivate func checkUser(username: String, password: String) {
        guard let list = userList else {return}
        
        for user in list {
            if user.username == username {
                if user.password == password {
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                    navigationController?.pushViewController(vc, animated: true)
                    print("giris et")
                } else {
                    print("Sifreniz duzgun deyil")
                }
            } else {
                print("bele user yoxdur")
            }
        }
    }
    
    fileprivate func setupView() {
        usernameField.layer.cornerRadius = 8
        usernameField.layer.borderColor = UIColor(named: "sari")?.cgColor
        usernameField.layer.borderWidth = 1
        
        passwordField.layer.cornerRadius = 8
        passwordField.layer.borderColor = UIColor(named: "sari")?.cgColor
        passwordField.layer.borderWidth = 1
        
        signInButton.layer.cornerRadius = 8
        
        signUpButton.layer.cornerRadius = 8
    }
    

}

extension SignInViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//           print(textField.text ?? "", #function)
//           return true
//       }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//           print(textField.text ?? "", #function)
//       }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//           print(textField.text ?? "", #function)
//       }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        switch textField {
        case usernameField:
            usernameField.layer.borderColor = text.count > 2 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case passwordField:
            passwordField.layer.borderColor = text.count > 7 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        default:
            break
        }
    }
}
