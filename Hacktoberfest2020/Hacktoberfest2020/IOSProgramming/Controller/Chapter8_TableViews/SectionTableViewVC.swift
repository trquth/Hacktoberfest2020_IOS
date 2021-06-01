//
//  SectionTableViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 07/04/2021.
//

import UIKit

class SectionTableViewVC: UITableViewController {
    
    struct Section {
        var sectionName: String
        var rowData : [String]
    }
    
    var sections : [Section]!

    let cellId = "cellId"
    let headerId = "headerId"
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        let s = try! String(
            contentsOfFile: Bundle.main.path(
                forResource: "states", ofType: "txt")!)
        let states = s.components(separatedBy:"\n")
        let d = Dictionary(grouping: states) {String($0.prefix(1))}
        self.sections = Array(d).sorted {$0.key < $1.key}.map {
            Section(sectionName: $0.key, rowData: $0.value)
        }
        
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        self.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: self.headerId)
        
        self.tableView.sectionIndexColor = .white
        self.tableView.sectionIndexBackgroundColor = .red
        self.tableView.sectionIndexTrackingBackgroundColor = .blue
        
        //self.tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 59)
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        let s = self.sections[indexPath.section].rowData[indexPath.row]
        cell.textLabel?.text = s
        var stateName = s
        stateName = stateName.lowercased()
        stateName = stateName.replacingOccurrences(of: " ", with: "")
        stateName = "flag_\(stateName).gif"
        let img = UIImage(named: stateName)
        cell.imageView?.image = img

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return self.sections[section].sectionName
        //return nil
        return ""
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let h = tableView.dequeueReusableHeaderFooterView(withIdentifier: self.headerId)!
        if h.viewWithTag(1) == nil {
            h.backgroundView = UIView()
            h.backgroundView?.backgroundColor = .black
            let lab = UILabel()
            lab.tag = 1
            lab.textColor = .white
            lab.font = UIFont.boldSystemFont(ofSize: 18)
            lab.translatesAutoresizingMaskIntoConstraints = false
            h.contentView.addSubview(lab)
            NSLayoutConstraint.activate([
                lab.centerYAnchor.constraint(equalTo: h.contentView.centerYAnchor),
                lab.leadingAnchor.constraint(equalTo: h.contentView.leadingAnchor,constant: 10),
                lab.trailingAnchor.constraint(equalTo: h.contentView.trailingAnchor, constant: 10)
            ])
        }
        let lab = h.viewWithTag(1) as! UILabel
        lab.text = self.sections[section].sectionName
        return h
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sections.map{$0.sectionName}
    }

}
