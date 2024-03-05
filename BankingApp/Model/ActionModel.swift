//
//  ActionModel.swift
//  BankingApp
//
//  Created by God's on 2/24/24.
//

import Foundation
import UIKit

struct Action {
    
    var id: Int?
    var name: String?
    var icon: String?
    var color: String?
    var title: String?
    
    var titleText: String {
        name ?? ""
    }
    
    var amount: String {
        "10"
    }
    
    var backgroundColor: UIColor {
        .red
    }
}
