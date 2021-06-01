//
//  HighLightTextVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 14/01/2021.
//

import UIKit

class HighLightTextVC: UITableViewController {

    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hight Light Text"

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        if  cell.contentView.viewWithTag(1) == nil {
            let label = UILabel()
            label.tag = 1
            label.textColor = .blue
            let color = indexPath.row == 0 ? UIColor.black : UIColor.blue
           label.attributedText = NSMutableAttributedString(string: "This is\n a test", attributes: [.foregroundColor: color])
            label.sizeToFit()
            label.highlightedTextColor = .red
            cell.contentView.addSubview(label)
        }
        
        return cell
    }


}
