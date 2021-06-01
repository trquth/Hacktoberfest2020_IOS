//
//  AutoScrollingTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 16/01/2021.
//

import UIKit

class AutoScrollingTableVC: UITableViewController {
        
    let cellId = "Cell"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Auto Scrolling Table"
        
        self.tableView.register(UINib(nibName: "AutoScrollingTableCell", bundle: nil), forCellReuseIdentifier: cellId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
    override func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        print("did adjust")
        print("contentInset", self.tableView.contentInset)
        print("indicatorInsets", self.tableView.scrollIndicatorInsets)
        print("adjustedContentInsets", self.tableView.adjustedContentInset)
        print("safe area", self.tableView.safeAreaInsets)
        print("additional safe area", self.additionalSafeAreaInsets)
    }
    
}
