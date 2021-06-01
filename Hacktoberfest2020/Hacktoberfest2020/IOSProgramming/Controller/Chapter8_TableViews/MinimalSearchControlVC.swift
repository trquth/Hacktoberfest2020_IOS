//
//  MinimalSearchControlVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/04/2021.
//

import UIKit

class MinimalSearchControlVC: UIViewController {

    var sc : UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc2 = SecondViewController()
        let sc = UISearchController(searchResultsController: vc2)
        sc.searchResultsUpdater = vc2
        self.sc = sc
        let sb = sc.searchBar
        self.view.addSubview(sb)
    }
}

class SecondViewController : UIViewController , UISearchResultsUpdating {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .cyan
    }
 
    func updateSearchResults(for searchController: UISearchController) {
        print("\(SecondViewController.self) \(#function)")
        if let text = searchController.searchBar.text, !text.isEmpty {
            print(text)
        }
    }
}
