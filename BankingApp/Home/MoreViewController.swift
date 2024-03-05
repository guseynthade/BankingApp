//
//  MoreViewController.swift
//  BankingApp
//
//  Created by God's on 1/17/24.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet private weak var signOut: UIButton!
    
    @IBAction func signOutAction(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        navigationController?.setNavigationBarHidden(true, animated: true)

        // Do any additional setup after loading the view.
    }
    
    fileprivate func setupView() {
        signOut.layer.borderWidth = 1
        signOut.layer.borderColor = UIColor(named: "sari")?.cgColor
        signOut.layer.cornerRadius = 8
    }

}
