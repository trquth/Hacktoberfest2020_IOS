//
//  RowActionTableVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/04/2021.
//

import UIKit

class RowActionTableVC: UITableViewController {

    var originalData : [String]!
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "states", ofType: "txt")!
        let s = try! String(contentsOfFile: path)
        self.originalData = s.components(separatedBy: "\n")
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    @objc func doEdit(_ sender: Any){
//        if self.tableView.isEditing {
//            self.setEditing(false, animated: true)
//        }else{
//            self.setEditing(true, animated: true)
//        }
//
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: self.tableView.isEditing ? .done : .edit, target: self, action: nil)
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.originalData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        cell.textLabel?.text = self.originalData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let m = UIContextualAction(style: .normal, title: "🥳") { (action, view, completion) in
            print("🥳")
        }
        m.backgroundColor = .blue
        
        let config = UISwipeActionsConfiguration(actions: [m])
        config.performsFirstActionWithFullSwipe = true
        return config
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let d = UIContextualAction(style: .destructive, title: nil) { (action, view, completion) in  print("😏")
            
        }
        var trashImg = UIImage(named: "trash")!
        trashImg = trashImg.withTintColor(.white)
        d.image = UIGraphicsImageRenderer(size:CGSize(25, 25)).image{
            context in trashImg.draw(in:CGRect(0, 0, 25, 25))
        }
        
        let m = UIContextualAction(style: .normal, title: "🥳"){
            action, view, completion in
            print("🥳")
        }
        m.backgroundColor = .blue
        
        let config = UISwipeActionsConfiguration(actions: [d,m])
        config.performsFirstActionWithFullSwipe = true
        return config
    }
}
