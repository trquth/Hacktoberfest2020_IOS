//
//  TextFieldWithScrollViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/01/2021.
//

import UIKit

class TextFieldWithScrollViewVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var sv: UIScrollView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var oldContentOffset = UIEdgeInsets.zero
    var oldIndicatorInset = UIEdgeInsets.zero
    var oldOffset = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TextField With ScrollView"
        
        let contentView = self.sv.subviews[0]
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: self.sv.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: self.sv.heightAnchor
            )
        ])
        
        self.sv.keyboardDismissMode = .interactive
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
