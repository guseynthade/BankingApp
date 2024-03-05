//
//  Card.swift
//  BankingApp
//
//  Created by God's on 1/30/24.
//

import Foundation
import RealmSwift
import UIKit

class Card: Object, CardCellProtocol{
    var panString: String {
        pan ?? ""
    }
    
    var titleText: String {
        cardName ?? ""
    }
    
    var amountString: String {
        "\(amount)"
    }
    
    var cardTypeString: String {
        cardType ?? ""
    }
    
    var backgroundColor: UIColor {
        .blue
    }
    
    @Persisted var cardIDN: String?
    @Persisted var pan: String?
    @Persisted var amount = 0.0
    @Persisted var cardName: String?
    @Persisted var cardType: String?
    @Persisted var backgrounfColor: String?
//    @Persisted var isFavorite: Bool?
    
    override static func primaryKey() -> String? {
        return "cardIDN"
    }
}
