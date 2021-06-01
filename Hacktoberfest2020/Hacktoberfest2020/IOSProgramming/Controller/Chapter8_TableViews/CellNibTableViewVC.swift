//
//  CellNibTableViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 06/04/2021.
//

import UIKit

class CellNibTableViewVC: UITableViewController {

    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "MyCell2", bundle: nil), forCellReuseIdentifier: self.cellId)
        //self.tableView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.tableView.rowHeight = 58
        self.tableView.alwaysBounceHorizontal = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)

        let lbl = cell.viewWithTag(1) as! UILabel
        lbl.text = "The author of this book, who would rather be out dirt biking"
    
        let imv = cell.viewWithTag(2) as! UIImageView
        let im = UIImage(named: "moi.png")!
        let r = UIGraphicsImageRenderer(size: CGSize(36, 36), format: im.imageRendererFormat)
        let im2 = r.image {
            _ in im.draw(in:CGRect(0,0,36,36))
        }
        imv.image = im2
        imv.contentMode = .center

        return cell
    }


   

}
