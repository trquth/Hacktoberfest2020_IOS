//
//  EditInsertAndRearrangeTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/04/2021.
//

import UIKit

class EditInsertAndRearrangeTableVC: UITableViewController {

    var name = ""
    var numbers = [String]()
    
    let cellId = "cellId"
    
    init() {
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name = "trquth"
        self.numbers = ["036805XXXX"]
        
        self.tableView.register(UINib(nibName: "MyCell4", bundle: nil), forCellReuseIdentifier: self.cellId)
        self.tableView.allowsSelection = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return numbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! MyCell4
        switch indexPath.section {
        case 0:
            cell.textField.text = self.name
            break
        case 1:
            cell.textField.text = self.numbers[indexPath.row]
            break
        default:
            break
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Name"
        }
        return "Number"
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 1 {
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 1 {
            let ct = self.tableView(tableView, numberOfRowsInSection: indexPath.row)
            if ct-1 == indexPath.row {
                return .insert
            }
            return .delete
        }
        return .none
    }
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}
