//
//  Extension.swift
//  BankingApp
//
//  Created by God's on 2/25/24.
//

import Foundation
import UIKit

class Transaction {
    var sender: Card?
    var receiver: Card?
    var amount: Double = 0.0
    var date: Date?
    
    // İhtiyaç duyulursa başka özellikler eklenebilir
}


extension UIImage {

    func aspectFitImage(inRect rect: CGRect) -> UIImage? {
        let width = self.size.width
        let height = self.size.height
        let aspectWidth = rect.width / width
        let aspectHeight = rect.height / height
        let scaleFactor = aspectWidth > aspectHeight ? rect.size.height / height : rect.size.width / width

        UIGraphicsBeginImageContextWithOptions(CGSize(width: width * scaleFactor, height: height * scaleFactor), false, 0.0)
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: width * scaleFactor, height: height * scaleFactor))

        defer {
            UIGraphicsEndImageContext()
        }

        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
