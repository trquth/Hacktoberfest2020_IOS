//
//  SearchContainerWithTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/12/2020.
//

import UIKit

class SearchContainerVC: UISearchContainerViewController {
    init(data: [Any]) {
        let src = SearchResultsVC()
        let searcher = UISearchController(searchResultsController: src)
        super.init(searchController: searcher)
        
        searcher.searchResultsUpdater = src
        searcher.hidesNavigationBarDuringPresentation = false
        
        self.navigationItem.searchController = searcher
        
        let b = searcher.searchBar
        b.autocapitalizationType = .none
       // b.delegate = src as! UISearchBarDelegate
        b.showsCancelButton = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

class SearchContainerWithTableVC: UITableViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(doSearch))
        //self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(doEdit))
        
        self.tableView.allowsSelectionDuringEditing = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
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

    @objc func doSearch(_ sender: Any){
        let vc = SearchContainerVC(data: [])
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }

}


extension SearchContainerWithTableVC : UISearchControllerDelegate{
    
}

extension SearchContainerWithTableVC {
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        print("do it")
        if !self.isEditing {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    @objc func doEdit(_ sender : Any){
        var which: UIBarButtonItem.SystemItem
        if !self.tableView.isEditing {
            self.tableView.setEditing(true, animated: true)
            which = .done
        }else{
            self.tableView.setEditing(false, animated: true)
            which = .edit
        }
        
        let b = UIBarButtonItem(barButtonSystemItem: which, target: self, action: #selector(doEdit))
        self.navigationItem.leftBarButtonItem = b
    }
}
