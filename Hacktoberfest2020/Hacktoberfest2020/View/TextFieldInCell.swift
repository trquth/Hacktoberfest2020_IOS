//
//  TextFieldInCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 17/07/2021.
//

import UIKit

protocol TextFieldInCellDelegate {
    func textFieldInCellInput(fieldName name: String, withText text: String)
}

class TextFieldInCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var textInput: UITextField!
    var delegate: TextFieldInCellDelegate?
    var fieldName = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textInput.delegate = self
    }   
}

extension TextFieldInCell : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text
        delegate?.textFieldInCellInput(fieldName: fieldName, withText: text!)
    }
}
