//
//  LocationDetailCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 17/12/2020.
//

import UIKit

class LocationDetailCell: UITableViewCell {
//    override func layoutSubviews() {
//        self.textLabel?.textAlignment = .center
//        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        self.detailTextLabel?.textAlignment = .center
//    }
//
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: CellStyle.value2, reuseIdentifier: reuseIdentifier)
        
        self.textLabel?.textAlignment = .left
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.textLabel?.numberOfLines = 4
        self.detailTextLabel?.textAlignment = .right
        self.detailTextLabel?.numberOfLines = 2
        
//        self.indentationLevel = 0
//        self.indentationWidth = 1140
       self.separatorInset = UIEdgeInsets(top: 0, left: 5, bottom:0, right: 5)
        self.selectionStyle = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
