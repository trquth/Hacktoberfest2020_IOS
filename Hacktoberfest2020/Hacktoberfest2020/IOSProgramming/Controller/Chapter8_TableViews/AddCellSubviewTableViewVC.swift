//
//  AddCellSubviewTableViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 05/04/2021.
//

import UIKit

class AddCellSubviewTableViewVC: UITableViewController {

    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//        self.tableView.insetsContentViewsToSafeArea = false
        self.tableView.separatorInsetReference = .fromCellEdges
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
        
        if cell.viewWithTag(1) == nil{
            let iv = UIImageView()
            iv.tag = 1
            cell.contentView.addSubview(iv)
            
            let lab = UILabel()
            lab.tag = 2
            cell.contentView.addSubview(lab)
            
            // since we are now adding the views ourselves,
            // we can use autolayout to lay them out
            
            let d = ["iv":iv, "lab":lab]
            iv.translatesAutoresizingMaskIntoConstraints = false
            lab.translatesAutoresizingMaskIntoConstraints = false
            var con = [NSLayoutConstraint]()
            // image view is vertically centered
            con.append(
                iv.centerYAnchor.constraint(equalTo:cell.contentView.centerYAnchor))
            // it's a square
            con.append(
                iv.widthAnchor.constraint(equalTo:iv.heightAnchor))
            // label has height pinned to superview
            con.append(contentsOf:
                NSLayoutConstraint.constraints(withVisualFormat:"V:|[lab]|",
                metrics:nil, views:d))
            // horizontal margins: use margins, for iPad and readable width
            con.append(
                lab.leadingAnchor.constraint(equalTo:
                    cell.contentView.layoutMarginsGuide.leadingAnchor))
            con.append(
                lab.trailingAnchor.constraint(equalTo:
                    iv.leadingAnchor, constant:-16))
            con.append(
                iv.trailingAnchor.constraint(equalTo:
                    cell.contentView.layoutMarginsGuide.trailingAnchor))
            NSLayoutConstraint.activate(con)
            
            lab.font = UIFont(name:"Helvetica-Bold", size:16)
            lab.lineBreakMode = .byWordWrapping
            lab.numberOfLines = 2
        }
        
        let lab = cell.viewWithTag(2) as! UILabel
        lab.text = "The author of this book, who would rather be out dirt biking"
        let iv = cell.viewWithTag(1) as! UIImageView
        // shrink apparent size of image
        let im = UIImage(named:"moi.png")!
        let r = UIGraphicsImageRenderer(size:CGSize(36,36), format:im.imageRendererFormat)
        let im2 = r.image {
            _ in im.draw(in:CGRect(0,0,36,36))
        }
        
        iv.image = im2
        iv.contentMode = .center
        return cell
    }
    

   

}
