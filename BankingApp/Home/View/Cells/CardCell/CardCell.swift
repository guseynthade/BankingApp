//
//  CardCell.swift
//  BankingApp
//
//  Created by God's on 2/9/24.
//

import UIKit
import RealmSwift

protocol CardCellProtocol {
    var titleText: String {get}
    var amountString: String {get}
    var cardTypeString: String {get}
    var backgroundColor: UIColor {get}
    var panString: String {get}
}

class CardCell: UICollectionViewCell {
    
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var cardType: UIImageView!
    @IBOutlet private weak var favButton: UIButton!
    @IBOutlet private weak var cardNumber: UILabel!
    @IBOutlet private weak var cardTitle: UILabel!
    @IBOutlet private weak var amount: UILabel!
    
    @IBAction func favAction(_ sender: UIButton ) {
        sender.isSelected = !sender.isSelected
                if sender.isSelected {
                } else {
                }
        
        print(#function)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    func confCell(data: CardCellProtocol) {
        cardType.image = UIImage(named: data.cardTypeString)
        cardTitle.text = data.titleText
        cardNumber.text = data.panString
        amount.text = data.amountString
    }
    
    fileprivate func setupView() {
        cardView.layer.cornerRadius = 16
        let image = UIImage(named: "visa")
        cardType.image = image?.aspectFitImage(inRect: cardType.frame)
        cardType.contentMode = .right
    }
    
}
