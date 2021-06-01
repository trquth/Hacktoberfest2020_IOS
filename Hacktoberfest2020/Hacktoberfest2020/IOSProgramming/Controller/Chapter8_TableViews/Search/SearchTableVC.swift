//
//  SearchTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/04/2021.
//

import UIKit

class MySearchVC : UISearchController {
    
}

class SearchTableVC: UITableViewController {

    var states : [String]!
    let cellId = "cellId"
    var sc : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "states", ofType: "txt")!
        let s = try! String(contentsOfFile: path)
        let data = s.components(separatedBy: "\n")
        self.states = data
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.sectionIndexColor = .orange
        self.tableView.sectionIndexBackgroundColor = .lightGray
        
        let src = SearchResults2TableVC(data: data)
        let mySearchVC = MySearchVC(searchResultsController: src)
        self.sc = mySearchVC
        let searchBarView = mySearchVC.searchBar
        //searchBarView.scopeButtonTitles = ["States","All"]
        mySearchVC.searchResultsUpdater = src
        searchBarView.autocapitalizationType = .none
        self.tableView.tableHeaderView = searchBarView
//        self.tableView.reloadData()
//        self.tableView.scrollToRow(at: IndexPath(row: self.states.count - 1, section: 0), at: .top, animated: true)
    
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        cell.textLabel?.text = self.states[indexPath.row]
        return cell
    }
    
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return self.states.map {
//            $0
//        }
//    }
}
