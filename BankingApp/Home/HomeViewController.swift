//
//  HomeViewController.swift
//  BankingApp
//
//  Created by God's on 1/17/24.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak private var mainCollection: UICollectionView!
    
    private var actionList: [Action] = []
    
    let realm = RealmHelper.instance.realm
    private var cardList: Results<Card>?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        quickActionList()
        getCardList()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        print(realm?.configuration.fileURL ?? "")

        
    }
    
    fileprivate func createCard(
        pan: String?,
        cardType: String,
        cardName: String,
        finished:() -> Void) {
        let card = Card()
            card.cardType = cardType
            card.amount = 43
            card.cardName = cardName
            card.pan = pan
            card.cardIDN = UUID().uuidString
            
        try! realm?.write {
            realm?.add(card)
            finished()
        }
        self.getCardList()
    }
    
    fileprivate func getCardList() {
        let results = realm?.objects(Card.self)
        cardList = results
        mainCollection.reloadData()
    }
    
    fileprivate func setupView() {
        mainCollection.register(UINib(nibName: "CardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionCell")
        
        mainCollection.register(UINib(nibName: "ActionCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ActionCollectionCell")
        
        mainCollection.register(UINib(nibName: "PlusCardCell", bundle: nil), forCellWithReuseIdentifier: "PlusCardCell")
    }
    
    fileprivate func quickActionList() {
        let list = [
        Action(id: 0, name: "Create", icon: "addCard", color: "sari", title: "Add card"),
        Action(id: 1, name: "Transfer", icon: "transfer", color: "benovse", title: "Transfer"),
        Action(id: 2, name: "Delete", icon: "deleteCard", color: "yasil", title: "Delete card")
        ]
        
        actionList = list
    }
    
    fileprivate func createCardCol() {
        createCard(pan: "1234 5332 5332 5332", cardType: "master", cardName: "Salary") { [weak self] in
            guard let self = self else {return}
            self.getCardList()
        }
    }
    
    fileprivate func navAction(id: Int) {
        print(#function, id)
        switch id {
        case 0:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddCardViewController") as! AddCardViewController
//            vc.callback
            navigationController?.present(vc, animated: true)
            break
        case 1:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TransferViewController") as! TransferViewController
//            vc.callback
            navigationController?.present(vc, animated: true)
            break
        case 2:
            try! realm?.write {
                realm?.delete(cardList?.last ?? Card())
                self.getCardList()
            }
            break
        default:
            break
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            guard let cardList = cardList else {return UICollectionViewCell()}
            
            if cardList.isEmpty {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlusCardCell", for: indexPath) as! PlusCardCell
                return cell
                
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionCell", for: indexPath) as! CardCollectionCell
                cell.setList(list: cardList)
                return cell
            }
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActionCollectionCell", for: indexPath) as! ActionCollectionCell
            cell.setList(list: actionList)
            cell.actionCallback = { [weak self] id in
            guard let self = self else {return}
            self.navAction(id: id)
            }
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width:collectionView.frame.width, height: 260)
        } else {
            return CGSize(width:collectionView.frame.width, height: 86)
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cardList = cardList, cardList.isEmpty else {return}
        if cardList.isEmpty {
            createCardCol()
        } else {return}
    }
}
