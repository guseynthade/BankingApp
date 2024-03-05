//
//  ActionCollectionCell.swift
//  BankingApp
//
//  Created by God's on 2/9/24.
//

import UIKit

class ActionCollectionCell: UICollectionViewCell {
    
    @IBOutlet private weak var actionCollection: UICollectionView!
    
    private var actionList: [Action]?
    var actionCallback: ((Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        actionCollection.register(UINib(nibName: "ActionCell", bundle: nil), forCellWithReuseIdentifier: "ActionCell")
    }
    
    func setList(list: [Action]) {
        actionList = list
    }

}

extension ActionCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actionList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActionCell", for: indexPath) as! ActionCell
        guard let item = actionList?[indexPath.row] else { return UICollectionViewCell()
        }
        
        cell.congActionCell(item: item)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = actionList?[indexPath.row].id else {return}
        print(#function, "Did select: \(id)")
                actionCallback?(id)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/3, height: 64)
            
        }
}
