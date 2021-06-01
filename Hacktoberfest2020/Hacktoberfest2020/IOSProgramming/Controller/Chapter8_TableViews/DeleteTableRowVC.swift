//
//  DeleteTableRowVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/04/2021.
//

import UIKit

class DeleteTableRowVC: UITableViewController {

    var originalData : [String]!
    let cellId = "cellId"
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "states", ofType: "txt")!
        let s = try! String(contentsOfFile: path)
        self.originalData = s.components(separatedBy: "\n")
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(doEdit)) //Don't trigger setEditting method
        self.navigationItem.rightBarButtonItem = self.editButtonItem //This way will trigger to setEditting method
        
        self.tableView.allowsSelectionDuringEditing = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        print("\(#function) \(self.isEditing)")
        if !self.isEditing {
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
    @objc func doEdit(_ sender: Any){
        var buttonType : UIBarButtonItem.SystemItem
        if !self.tableView.isEditing {
            self.tableView.setEditing(true, animated: true)
            buttonType = .done
        }else{
            self.tableView.setEditing(false, animated: true)
            buttonType = .edit
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: buttonType, target: self, action: #selector(doEdit))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.originalData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        cell.textLabel?.text = self.originalData[indexPath.row]
        return cell
    }
    
    //MARK: - Delete

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.originalData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }else{
            
        }
    }
    //Prevent swipe to edit
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .none
//    }
    override func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        self.setEditing(true, animated: true)
        return true
    }
    
    override func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        
    }
    override func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {
        let selectedRowIndex = tableView.indexPathsForSelectedRows
        print("\(#function) \(selectedRowIndex)")
        if selectedRowIndex == nil {
            self.navigationItem.leftBarButtonItem = nil
        }else{
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(doDeleteSelected))
        }
    }
    
    @objc func doDeleteSelected(_ sender: Any){
        guard let sel = self.tableView.indexPathsForSelectedRows else { return }
        for ip in sel.sorted().reversed() {
            self.originalData.remove(at: ip.row)
        }
        self.tableView.deleteRows(at: sel, with: .automatic)
    }
    
    //MARK: - Moving
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return proposedDestinationIndexPath
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentIndex = sourceIndexPath.row
        let destinationIndex = destinationIndexPath.row
        self.originalData.swapAt(currentIndex, destinationIndex)
        print("after swap \(self.originalData)")
    }
}
