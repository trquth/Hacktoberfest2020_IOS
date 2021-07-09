//
//  InsetTextField.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 04/07/2021.
//

import UIKit

class InsetTextField: UITextField {

    private var textRectOffset: CGFloat = 20
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    override  func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    func setupView() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [.foregroundColor : UIColor.lightGray])
        self.attributedPlaceholder = placeholder
    }

}
