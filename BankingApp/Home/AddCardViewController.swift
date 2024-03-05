//
//  AddCardViewController.swift
//  BankingApp
//
//  Created by God's on 2/27/24.
//

import UIKit
import RealmSwift

class AddCardViewController: UIViewController {
    
    @IBOutlet private weak var cardField: UITextField! {
        didSet {
            let placeholder = NSAttributedString(string: "Card number",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
            
            cardField.attributedPlaceholder = placeholder
        }
    }
    @IBOutlet private weak var amountField: UITextField! {
        didSet {
            let placeholder = NSAttributedString(string: "Amount",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
            
            amountField.attributedPlaceholder = placeholder
        }
    }
    @IBOutlet private weak var cardTypeField: UITextField! {
        didSet {
            let placeholder = NSAttributedString(string: "Card Type",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
            
            cardTypeField.attributedPlaceholder = placeholder
        }
    }
    @IBOutlet private weak var cardNameField: UITextField! {
        didSet {
            let placeholder = NSAttributedString(string: "Card Name",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "sari")!.withAlphaComponent(0.4)])
            
            cardNameField.attributedPlaceholder = placeholder
        }
    }
    @IBOutlet private weak var close: UIButton!
    @IBOutlet private weak var addCard: UIButton!
    
    @IBAction func addAction(_ sender: UIButton) {
        saveCardToRealm()
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    let realm = RealmHelper.instance.realm
    
    private var cardList: Results<Card>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    fileprivate func setupView() {
        cardField.layer.cornerRadius = 8
        cardField.layer.borderWidth = 1
        cardField.layer.borderColor = UIColor(named: "sari")?.cgColor
        
        amountField.layer.cornerRadius = 8
        amountField.layer.borderWidth = 1
        amountField.layer.borderColor = UIColor(named: "sari")?.cgColor
        
        cardNameField.layer.cornerRadius = 8
        cardNameField.layer.borderWidth = 1
        cardNameField.layer.borderColor = UIColor(named: "sari")?.cgColor
        
        cardTypeField.layer.cornerRadius = 8
        cardTypeField.layer.borderWidth = 1
        cardTypeField.layer.borderColor = UIColor(named: "sari")?.cgColor
        
        addCard.layer.cornerRadius = 8
    }
    
    fileprivate func createCard(
        pan: String,
        amount: Double,
        cardType: String,
        cardName: String,
        finished:() -> Void) {
            let card = Card()
            card.cardType = cardType
            card.amount = amount
            card.cardName = cardName
            card.pan = pan
            card.cardIDN = UUID().uuidString
            
            try! realm?.write {
                realm?.add(card)
                finished()
            }
        }
    
    fileprivate func getCardList() {
        let results = realm?.objects(Card.self)
        cardList = results
    }
    
    fileprivate func createCard() {
        createCard(pan: "1234 2345 3456 4567", amount: 43.4, cardType: "master", cardName: "salary") { [weak self] in
            guard let self = self else {return}
            self.getCardList()
        }
    }
    
    fileprivate func saveCardToRealm() {
        guard let panString = cardField.text,
              let pan = Int(panString),
              let amountString = amountField.text,
              let amount = Int(amountString),
              let cardType = cardTypeField.text,
              let cardName = cardNameField.text else {return}
        
        if panString.isEmpty || panString.count < 15 ||
            amountString.isEmpty || amountString.count < 1 ||
            cardType.isEmpty || cardName.isEmpty {
            
            cardField.layer.borderColor = UIColor(named: "error")?.cgColor
            cardField.layer.borderWidth = 1
            
            amountField.layer.borderColor = UIColor(named: "error")?.cgColor
            amountField.layer.borderWidth = 1
            
            cardTypeField.layer.borderColor = UIColor(named: "error")?.cgColor
            cardTypeField.layer.borderWidth = 1
            
            cardNameField.layer.borderColor = UIColor(named: "error")?.cgColor
            cardNameField.layer.borderWidth = 1
            
        } else {
            createCard(pan: String(pan), amount: Double(amount), cardType: cardType, cardName: cardName) { [weak self] in
                guard let self = self else {return}
                navigationController?.popViewController(animated: true)
                
                cardField.layer.borderColor = UIColor(named: "sari")?.cgColor
                amountField.layer.borderColor = UIColor(named: "sari")?.cgColor
                cardTypeField.layer.borderColor = UIColor(named: "sari")?.cgColor
                cardNameField.layer.borderColor = UIColor(named: "sari")?.cgColor
                
                dismiss(animated: true)
            }
            print(#function)
        }
    }
    
}


extension AddCardViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        switch textField {
        case cardField:
            cardField.layer.borderColor = text.count > 15 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case amountField:
            amountField.layer.borderColor = text.count > 0 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case cardTypeField:
            cardTypeField.layer.borderColor = text.count > 3 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        case cardNameField:
            cardNameField.layer.borderColor = text.count > 3 ? UIColor(named: "sari")?.cgColor : UIColor(named: "error")?.cgColor
        default:
            break
        }
    }
}
