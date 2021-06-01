//
//  TextFieldWithTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/01/2021.
//

import UIKit

class TextFieldWithTableVC: UITableViewController {

    let cellId = "CellId"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TextField With Table"
        self.tableView.register(UINib(nibName: "TextFieldWithTableCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TextFieldWithTableCell
        cell.tf.placeholder = "TextField in Row \(indexPath.row + 1)"
        return cell
    }
    
}
