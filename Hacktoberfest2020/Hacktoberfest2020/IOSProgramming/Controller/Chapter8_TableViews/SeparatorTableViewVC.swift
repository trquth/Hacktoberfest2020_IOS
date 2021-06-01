//
//  SeparatorTableViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 05/04/2021.
//

import UIKit

class SeparatorTableViewVC: UITableViewController {
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = .orange
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        cell.textLabel?.text = "Test"
        
        cell.contentView.backgroundColor = .yellow
        print("🌻  \(indexPath.row) before",cell.separatorInset)
        if indexPath.row % 2 == 0 {
            print("🏃‍♂️")
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        print("🌻 \(indexPath.row) after",cell.separatorInset)
        print("🌻 \(indexPath.row) cell content layout margin \(cell.contentView.layoutMargins)")
        return cell
    }

}
