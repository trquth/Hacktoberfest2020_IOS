//
//  LocationDetailVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 16/12/2020.
//

import UIKit

class LocationDetailVC: UITableViewController {
    
    private let cellId = "cellId"
    private let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Location Detail"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: nil)
        
        //Configure Table View
        tableView.register(LocationDetailCell.self, forCellReuseIdentifier: cellId)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerId )
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorInsetReference = .fromAutomaticInsets
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 15
        default:
           return 3
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! LocationDetailCell
        cell.textLabel?.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. "
        cell.detailTextLabel?.text = "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy."
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return "0"
//        default:
//            return "\(section)"
//        }
//    }
//
    
    //MARK: - Sections
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId)
        if header == nil {
            header = UITableViewHeaderFooterView()
        }
        header?.textLabel?.text = "No. \(section)"
        header?.detailTextLabel?.text = "Sub"
        let redView = UIView()
        redView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        header?.backgroundView = redView
    
        return header
    }
}
