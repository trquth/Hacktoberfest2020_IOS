//
//  VariableHeightsTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 07/04/2021.
//

import UIKit

class MyCell3 : UITableViewCell {
    @IBOutlet weak var lab: UILabel!
}

class VariableHeightsTableVC: UITableViewController {
    var trivia : [String]!
    
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource:"trivia", withExtension: "txt")
        let s = try! String(contentsOf:url!)
        let arr = s.components(separatedBy:"\n")
        self.trivia = Array(arr.dropLast())
        
        self.tableView.register(UINib(nibName: "MyCell3", bundle: nil), forCellReuseIdentifier: self.cellId)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trivia.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! MyCell3
        c.lab.text = self.trivia[indexPath.row]
        return c
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
}
