//
//  UserCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 15/07/2021.
//

import UIKit
import AlamofireImage
import Alamofire

class UserCell: UITableViewCell {

    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(user : User){
        fullNameLbl.text = "\(user.firstName) \(user.lastName)"
        emailLbl.text = user.email
        AF.request(user.avatar).responseImage { response in
            if case .success(let image) = response.result {
                self.avatarImg.image  = image
                self.avatarImg.markCircleAround()
               }
        }
        
    }
}
