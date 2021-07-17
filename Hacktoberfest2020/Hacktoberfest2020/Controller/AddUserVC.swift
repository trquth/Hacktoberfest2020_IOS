//
//  AddUserVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 17/07/2021.
//

import UIKit

class AddUserVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return cellFirstName(tableView: tableView, indexPath: indexPath)
        case 1:
            return cellLastName(tableView: tableView, indexPath: indexPath)
        default:
            return cellEmail(tableView: tableView, indexPath: indexPath)
        }
    }
    
    func cellFirstName(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldInCell", for: indexPath) as! TextFieldInCell
        cell.titleLbl.text = "First Name"
        cell.textInput.placeholder = "Input First Name"
        cell.fieldName = "firstName"
        cell.delegate = self
        return cell
    }
    
    func cellLastName(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldInCell", for: indexPath) as! TextFieldInCell
        cell.titleLbl.text = "Last Name"
        cell.textInput.placeholder = "Input Last Name"
        cell.fieldName = "lastName"
        cell.delegate = self
        return cell
    }
    
    func cellEmail(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldInCell", for: indexPath) as! TextFieldInCell
        cell.titleLbl.text = "Email"
        cell.textInput.placeholder = "Input Email"
        cell.fieldName = "email"
        cell.delegate = self
        return cell
    }

}

extension AddUserVC : TextFieldInCellDelegate {
    func textFieldInCellInput(fieldName name: String, withText text: String) {
        print("🍰🍰🍰🍰🍰 \(name) \(text)")
    }
    
   
    
    
}
