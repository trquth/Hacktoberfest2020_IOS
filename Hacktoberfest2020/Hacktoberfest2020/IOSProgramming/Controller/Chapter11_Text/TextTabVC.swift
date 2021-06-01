//
//  TextTabVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 14/01/2021.
//

import UIKit

class TextTabVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Text Tab"
        self.view.backgroundColor = .lightGray
        
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        self.view.addSubview(tv)
        
        NSLayoutConstraint.activate([
            tv.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tv.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            tv.widthAnchor.constraint(equalToConstant: 280),
            tv.heightAnchor.constraint(equalToConstant: 218)
        ])
        
        let s = "Onions\t$2.34\nPeppers\t$15.2\n"
        let ms = NSMutableAttributedString(string: s, attributes: [.font: UIFont(name:"GillSans", size:15)!])
        tv.attributedText = ms
        ms.append(NSAttributedString(string: "\n\n", attributes: nil))
        ms.append(NSAttributedString(string: "LINK", attributes: [
            .link : URL(string: "https://www.apple.com")!,
            .foregroundColor : UIColor.red.cgColor,
            .underlineStyle : NSUnderlineStyle.single.rawValue
        ]))
        tv.attributedText = ms
        tv.linkTextAttributes = [.foregroundColor : UIColor.orange]
        //tv.linkTextAttributes = [:]
        tv.isSelectable = true
    }

}
