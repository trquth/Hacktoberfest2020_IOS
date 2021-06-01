//
//  SearchBarWithTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/12/2020.
//

import UIKit

class SearchBarWithTableVC: UITableViewController {
    
    var searcher : UISearchController!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let src = SearchResultsVC()
        let searcher = UISearchController(searchResultsController: src)
        
        let b = searcher.searchBar
        self.navigationItem.titleView = b
        
        self.definesPresentationContext = true
        
        if #available(iOS 11.0, *) {
            print("Run with ios 14")
            self.navigationItem.hidesSearchBarWhenScrolling = false
            self.navigationItem.searchController = searcher
            searcher.hidesNavigationBarDuringPresentation = true
            self.navigationItem.title = "TEST"
            self.navigationController?.navigationBar.prefersLargeTitles = false
        }
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
