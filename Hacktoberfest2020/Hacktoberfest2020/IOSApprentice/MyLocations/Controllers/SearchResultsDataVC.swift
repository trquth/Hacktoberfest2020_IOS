//
//  SearchResultsVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 23/12/2020.
//

import UIKit

class SearchResultsDataVC: UITableViewController {
    
    var searchBar : UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

extension SearchResultsDataVC : UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let sb = searchController.searchBar
        self.searchBar = sb
        let target = sb.text!
        print("run updateSearchResults target",target)
        print("run searchController selectedIndexScope", self.searchBar.selectedScopeButtonIndex)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("run selectedScopeButtonIndexDidChange selectedIndexScope", self.searchBar.selectedScopeButtonIndex)
        
    }
    
    
}


