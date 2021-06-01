//
//  TextFieldWithTableCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/01/2021.
//

import UIKit

class TextFieldWithTableCell: UITableViewCell {
    @IBOutlet weak var tf: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
