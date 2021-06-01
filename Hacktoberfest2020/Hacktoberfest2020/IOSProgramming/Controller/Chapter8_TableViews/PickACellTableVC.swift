//
//  PickACellTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/04/2021.
//

import UIKit

class PickACellTableVC: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.9)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.accessoryType = .none
        if let title = self.tableView(tableView, titleForHeaderInSection: indexPath.section) {
            print("title \(title)")
            print("lb \(UserDefaults.standard.object(forKey: title) as? String)")
            if let lb = UserDefaults.standard.object(forKey: title) as? String {
                if lb == cell.textLabel?.text {
                    cell.accessoryType = .checkmark
                }
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionTitle = self.tableView(tableView, titleForHeaderInSection: indexPath.section)!
        let selectedRow = tableView.cellForRow(at: indexPath)?.textLabel?.text
        UserDefaults.standard.setValue(selectedRow, forKey: sectionTitle)
        tableView.reloadData()
    }
}
