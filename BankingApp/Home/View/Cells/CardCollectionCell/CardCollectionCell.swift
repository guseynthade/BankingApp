//
//  CardCollectionCell.swift
//  BankingApp
//
//  Created by God's on 2/9/24.
//

import UIKit
import RealmSwift

class CardCollectionCell: UICollectionViewCell {
    
    @IBOutlet private weak var cardCollection: UICollectionView!
    
    private var cardList: Results<Card>?
    let realm = RealmHelper.instance.realm
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardCollection.reloadData()
        
        cardCollection.register(UINib(nibName: "CardCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
    }
    
    func setList(list: Results<Card>) {
        cardList = list
        cardCollection.reloadData()
    }
}

extension CardCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        guard let card = cardList?[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.confCell(data: card)
        return cell
        
    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//            var visibleRect = CGRect()
//
//            visibleRect.origin = cardCollection.contentOffset
//            visibleRect.size = cardCollection.bounds.size
//
//            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
//
//            guard let indexPath = cardCollection.indexPathForItem(at: visiblePoint) else { return }
//
//            print(indexPath.row)
//            let selected = cardSelectedCallback?(indexPath.row)
//        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Card number: \(indexPath.row)")
    }
    
    
}
