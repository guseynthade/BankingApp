//
//  User.swift
//  BankingApp
//
//  Created by God's on 1/24/24.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted var username: String?
    @Persisted var name: String?
    @Persisted var surname: String?
    @Persisted var email: String?
    @Persisted var age = 0
    @Persisted var userID: String?
    @Persisted var password: String?
    
    override static func primaryKey() -> String? {
        return "userID"
    }
    
}

