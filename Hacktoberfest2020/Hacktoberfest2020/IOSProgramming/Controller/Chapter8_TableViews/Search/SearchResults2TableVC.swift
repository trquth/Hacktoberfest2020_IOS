//
//  SearchResultsTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/04/2021.
//

import UIKit

class SearchResults2TableVC: UITableViewController {
    
    var originalData: [String]!
    var filteredData = [String]()
    let cellId = "CellId"
    init(data: [String]) {
        self.originalData = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        cell.textLabel?.text = self.originalData[indexPath.row]
        return cell
    }
}

extension SearchResults2TableVC : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            self.filteredData = self.originalData.filter{
                $0.contains(searchText)
            }
            print(self.filteredData)
        }else{
            self.filteredData = self.originalData
        }
        self.tableView.reloadData()
    }
}
