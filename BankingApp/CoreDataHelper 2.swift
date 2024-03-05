////
////  CoreDataHelper.swift
////  BankingApp
////
////  Created by Fagan Aslanli on 14.01.24.
////
//
//import Foundation
//import UIKit
//import CoreData
//
//class CoreDataHelper {
//    static let shared = CoreDataHelper()
//    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    
//    //MARK: Fetch
//    func fetchCardList() -> [CardList]? {
//        do {
//            return try context.fetch(CardList.fetchRequest())
//        } catch  {
//            print("error: \(error.localizedDescription)")
//        }
//        
//        return nil
//    }
//    
//    //MARK: Save
//    func saveCard(name: String) {
//        
//        let card = CardList(context: context)
//        card.cardName = name
//        card.amount = 10.0
//        card.cardIdn = 0
//        card.cardType = "master"
//        
//        do {
//            try context.save()
//        } catch {
//            print("error: \(error.localizedDescription)")
//        }
//    }
//    
//    //MARK: Delete
//    
//    func deleteCardList(complete: () -> Void) {
//        if let userList = fetchCardList() {
//            for user in userList {
//                context.delete(user)
//            }
//            do {
//                try context.save()
//                complete()
//            } catch {
//                print("error: \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func deleteCard(cardIdn: Int, complete: () -> Void) {
//        guard let cardList = fetchCardList() else {
//            print("Card list is nil.")
//            return
//        }
//
//        for card in cardList {
//            if card.cardIdn == cardIdn {
//                context.delete(card)
//                break // Assuming card IDs are unique, no need to continue iterating
//            }
//        }
//
//        do {
//            try context.save()
//            complete()
//        } catch {
//            print("Error: \(error.localizedDescription)")
//        }
//    }
//
//}
