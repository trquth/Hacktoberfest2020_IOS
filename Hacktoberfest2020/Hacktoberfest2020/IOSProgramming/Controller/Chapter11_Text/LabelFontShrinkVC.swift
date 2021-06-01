//
//  LabelFontShrinkVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 14/01/2021.
//

import UIKit

class LabelFontShrinkVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Label Font Shrink"
        
        
        let s = "Little poltergeists make up the principal form of material manifestation and that's for sure."
        
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lab)
        
        NSLayoutConstraint.activate([
            lab.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            lab.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            lab.widthAnchor.constraint(equalToConstant: 280),
            lab.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        lab.numberOfLines = 2
        lab.adjustsFontSizeToFitWidth = false
        lab.text = s
        lab.font = UIFont(name:"GillSans", size:20)!
        lab.minimumScaleFactor = 5
        lab.baselineAdjustment = .none
        //lab.allowsDefaultTighteningForTruncation = true
        lab.lineBreakMode = .byTruncatingMiddle
        //lab.textAlignment = .center
        
    }

}
