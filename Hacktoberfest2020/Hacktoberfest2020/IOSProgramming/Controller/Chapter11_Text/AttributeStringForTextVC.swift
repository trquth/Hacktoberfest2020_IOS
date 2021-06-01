//
//  AttributeStringForTextVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 13/01/2021.
//

import UIKit

class AttributeStringForTextVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Attribute String"
        self.view.backgroundColor = .lightGray

        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)

        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: self.view.topAnchor,constant:  150),
            label1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label1.widthAnchor.constraint(equalToConstant: 300),
            label1.heightAnchor.constraint(equalToConstant: 200)
        ])
        label1.backgroundColor = .white
        label1.numberOfLines = 0
        let s1 =  """
                The Gettysburg Address, as delivered on a certain occasion \
                (namely Thursday, November 19, 1863) by A. Lincoln
                """

        let content = NSMutableAttributedString(string: s1, attributes: [
            .font : UIFont(name: "Arial-BoldMT", size: 15),
            .foregroundColor : UIColor(red:0.251, green:0.000, blue:0.502, alpha:1)
        ])
        
        let under : NSUnderlineStyle = [.thick,.patternDash]
        content.addAttributes([
            .strokeColor : UIColor.red,
            .strokeWidth : -2.0,
            .underlineStyle: under.rawValue
        ], range: (content.string as NSString).range(of: "Gettysburg Address"))
        
        //label1.numberOfLines = 2
        
        let para = NSMutableParagraphStyle()
        para.headIndent = 40
        para.firstLineHeadIndent = 70
        para.tailIndent = -40
        para.lineBreakMode = .byWordWrapping
        para.alignment = .center
        para.paragraphSpacing = 50
        content.addAttribute(.paragraphStyle, value: para, range: NSMakeRange(0, 1))
        
        label1.attributedText = content
        
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tv)
        NSLayoutConstraint.activate([
            tv.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
            tv.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tv.widthAnchor.constraint(equalTo: label1.widthAnchor),
            tv.heightAnchor.constraint(equalTo: label1.heightAnchor),
        ])
        
        tv.textContainerInset = UIEdgeInsets(top: 90, left: 0, bottom: 0, right: 40)
        
        tv.backgroundColor = .white
        
        tv.attributedText = content
        
        
    }

}
