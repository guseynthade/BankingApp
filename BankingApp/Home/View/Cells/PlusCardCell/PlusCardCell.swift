//
//  PlusCardCell.swift
//  BankingApp
//
//  Created by God's on 2/24/24.
//

import UIKit

class PlusCardCell: UICollectionViewCell {
    
    @IBOutlet private weak var plusView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        // Initialization code
    }

    fileprivate func setupView() {
        plusView.layer.borderWidth = 2
        plusView.layer.borderColor = UIColor(named: "sari")?.cgColor
        plusView.layer.cornerRadius = 16
    }
}
