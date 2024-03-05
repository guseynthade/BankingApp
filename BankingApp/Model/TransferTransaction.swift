//
//  TransferTransaction.swift
//  BankingApp
//
//  Created by God's on 3/5/24.
//

import Foundation
import RealmSwift

class TransferTransaction: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var sender: Card?
    @objc dynamic var receiver: Card?
    @objc dynamic var amount: Double = 0.0
    @objc dynamic var date: Date?

    convenience init(sender: Card?, receiver: Card?, amount: Double, date: Date?) {
        self.init()
        self.sender = sender
        self.receiver = receiver
        self.amount = amount
        self.date = date
    }
}
