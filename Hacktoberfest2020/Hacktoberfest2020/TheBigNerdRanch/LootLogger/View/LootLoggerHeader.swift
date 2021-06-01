//
//  LootLoggerHeader.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 29/11/2020.
//

import UIKit

class LootLoggerHeader : UITableViewHeaderFooterView {
    
    var addAction : ((UIButton) -> ())?
    var editAction : ((UIButton) -> ())?
    
    static func createButton(title : String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        return button
    }
    
    let addItemBtn : UIButton = {
        let button = createButton(title: "Add")
        button.addTarget(self, action: #selector(addItemHandler), for: .touchUpInside)
        return button
    }()
    
    let editItemBtn : UIButton = {
        let button = createButton(title: "Edit")
        button.addTarget(self, action: #selector(editItemHandler), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addAction = nil
        editAction = nil

        configureView()
    }
    
    @objc func addItemHandler(_ sender : UIButton){
        if let action = addAction {
            action(sender)
        }
    }
    
    @objc func editItemHandler(_ sender : UIButton){
        if let action = editAction {
            action(sender)
        }
    }
    
    func configureView() {
        self.contentView.backgroundColor = .white

        contentView.addSubview(addItemBtn)
        contentView.addSubview(editItemBtn)
        
        NSLayoutConstraint.activate([
            addItemBtn.heightAnchor.constraint(equalToConstant: 40),
            addItemBtn.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            addItemBtn.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            editItemBtn.heightAnchor.constraint(equalToConstant: 40),
            editItemBtn.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor
                                                 , constant: -10),
            editItemBtn.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

