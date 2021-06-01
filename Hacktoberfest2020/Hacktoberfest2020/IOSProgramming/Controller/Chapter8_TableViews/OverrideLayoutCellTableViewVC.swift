//
//  OverrideLayoutCellTableViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 05/04/2021.
//

import UIKit

class OverrideLayoutCellTableViewVC: UITableViewController {

    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = .orange
        self.tableView.register(MyCell.self, forCellReuseIdentifier: self.cellId)
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        self.tableView.rowHeight = 58
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! MyCell
        cell.textLabel?.text = "The author of this book, who would rather be out dirt biking"
        
        let im = UIImage(named:"moi.png")!
        let r = UIGraphicsImageRenderer(size:CGSize(36,36), format:im.imageRendererFormat)
        let im2 = r.image {
            _ in im.draw(in:CGRect(0,0,36,36))
        }
        cell.imageView?.image = im2
        cell.imageView?.contentMode = .center
        return cell
    }

}
