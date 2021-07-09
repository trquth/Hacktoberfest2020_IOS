//
//  ShadowView.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 04/07/2021.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView(){
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
    }
}
