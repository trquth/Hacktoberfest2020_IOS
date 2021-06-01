//
//  CellOfTableViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 05/04/2021.
//

import UIKit

class CellOfTableViewVC: UITableViewController {
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue
        self.tableView.backgroundColor = .orange
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: self.cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: self.cellId)
            cell?.textLabel?.textColor = .black
            let v = UIImageView(image: UIImage(named: "linen.png"))
            v.contentMode = .scaleToFill
            cell?.backgroundView = v
            
            let v2 = UIView()
            v2.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            cell.selectedBackgroundView = v2
            
            let b = UIButton()
            b.setTitle("Press! 🎯", for: .normal)
            b.sizeToFit()
            cell.accessoryView = b
        }
        
        cell.textLabel?.text = "Hello there! #\(indexPath.row + 1)"
        return cell
    }

}
