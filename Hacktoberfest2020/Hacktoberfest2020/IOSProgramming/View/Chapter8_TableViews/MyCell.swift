//
//  MyCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 05/04/2021.
//

import UIKit

class MyCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cvb = self.contentView.bounds
        let imf = self.imageView!.frame
        
        self.imageView?.frame.origin.x = cvb.size.width - imf.size.width - 15
        self.textLabel?.frame.origin.x = 15
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
