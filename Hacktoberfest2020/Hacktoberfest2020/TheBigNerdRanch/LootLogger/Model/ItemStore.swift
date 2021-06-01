//
//  ItemStore.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 28/11/2020.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
   @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(_ item : Item){
        if let index = allItems.firstIndex(of: item){
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int)  {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
    
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }
}
