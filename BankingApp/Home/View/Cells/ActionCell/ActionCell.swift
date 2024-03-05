//
//  ActionCell.swift
//  BankingApp
//
//  Created by God's on 2/9/24.
//

import UIKit

class ActionCell: UICollectionViewCell {
    
    @IBOutlet private weak var actionIcon: UIImageView!
    @IBOutlet private weak var actionView: UIView!
    @IBOutlet private weak var actionTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    fileprivate func setupView() {
        actionView.layer.cornerRadius = 16
    }
    
    public func congActionCell(item: Action) {
        actionIcon.image = UIImage(named: item.icon ?? "")
        actionView.backgroundColor = UIColor(named: item.color ?? "")
        actionTitle.text = item.title
    }
    
 }
