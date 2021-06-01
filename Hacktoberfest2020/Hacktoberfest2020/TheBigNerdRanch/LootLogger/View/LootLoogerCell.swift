//
//  LootLoogerCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 29/11/2020.
//

import UIKit

class LootLoggerCell : UITableViewCell{
    
    var nameLbl : UILabel  = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let attributes = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
        return lbl
    }()
    
    var serialNumberLbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let attributes = NSAttributedString(string: "Serial Number", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return lbl
    }()
    
    var valueLbl : UILabel  = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let attributes = NSAttributedString(string: "Value", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configView()
        
    }
    
    func configView() {
        contentView.addSubview(nameLbl)
        contentView.addSubview(serialNumberLbl)
        contentView.addSubview(valueLbl)
        
        let leftStackLbl = UIStackView(arrangedSubviews: [nameLbl, serialNumberLbl])
        leftStackLbl.translatesAutoresizingMaskIntoConstraints = false
        leftStackLbl.axis = .vertical
        leftStackLbl.distribution = .fillEqually
        contentView.addSubview(leftStackLbl)
        
        NSLayoutConstraint.activate([
            leftStackLbl.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            leftStackLbl.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            leftStackLbl.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            //leftStackLbl.trailingAnchor.constraint(equalTo: self.valueLbl.leadingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            valueLbl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            valueLbl.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            valueLbl.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 5),
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
