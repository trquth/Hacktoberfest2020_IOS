//
//  LootLoggerVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 28/11/2020.
//

import UIKit

class LootLoggerVC: UITableViewController {
    
    var itemStore: ItemStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(LootLoggerCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(LootLoggerHeader.self, forHeaderFooterViewReuseIdentifier: "Header")
        
        //tableView.rowHeight = 65
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LootLoggerCell
        
        let item = itemStore.allItems[indexPath.row]
        cell.nameLbl.text = item.name
        cell.serialNumberLbl.text = item.serialNumber
        cell.valueLbl.text = "$\(item.valueInDollars)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! LootLoggerHeader
        header.addAction = addNewItem
        header.editAction = toggleEditingMode
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            itemStore.removeItem(item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    //MARK: Add/Edit/Remove
    
    @objc func addNewItem(_ sender: UIButton){
        let newItem = itemStore.createItem()
        
        if let index = itemStore.allItems.firstIndex(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
       
    }
    
    @objc func toggleEditingMode(_ sender : UIButton){
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        }else{
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let row = tableView.indexPathForSelectedRow?.row{
//            let item = itemStore.allItems[row]
//            let lootLoggerDetail = LootLoggerDetailVC()
//            lootLoggerDetail.item = item
//        }
//       
//    }

}
