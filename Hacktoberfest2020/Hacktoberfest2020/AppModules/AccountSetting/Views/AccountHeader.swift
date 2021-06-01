//
//  AccountHeader.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 16/11/2020.
//

import UIKit

class AccountHeader : UITableViewHeaderFooterView {
    let defaultAvatar : UIImageView = {
        let avatar = UIImageView()
        avatar.heightAnchor.constraint(equalToConstant: 30).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 30).isActive = true
        avatar.image = #imageLiteral(resourceName: "resources_images_icons_ic_profile")
        avatar.contentMode = .scaleAspectFit
        
        return avatar
    }()
    
    let loginLbl : UILabel = {
        let lbl = UILabel()
        let attributes = NSMutableAttributedString(string: "Đăng nhập", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.white])
        lbl.attributedText = attributes
        
        return lbl
    }()
    
    let loginBtn : UIButton = {
        let button  = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(named: "resources_images_icons_ic_profile")

        
        button.setImage(image, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        //button.imageView?.contentMode = .scaleToFill
        
        button.setTitle("Đăng nhập", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)

       // button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
        //button.imageEdgeInsets = UIEdgeInsets(top: -10, left: -5, bottom: -10, right: 5)
       // button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        return button
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configureHeaderNoLogin()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureHeaderNoLogin() {
        self.tintColor = .orange // Using tintColor instead of backgroundColor to set color
        
//        let headerView = UIView()
//        headerView.backgroundColor = .orange
//
//        addSubview(headerView)
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//
//        let loginStack = UIStackView(arrangedSubviews: [defaultAvatar, loginLbl])
//        loginStack.spacing = 3
//
//        headerView.addSubview(loginStack)
//        loginStack.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
//            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
//            headerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            headerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
//            headerView.heightAnchor.constraint(equalToConstant: 80)
//        ])
//
//        NSLayoutConstraint.activate([
//            loginStack.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
//            loginStack.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10)
//        ])
        
        addSubview(loginBtn)
        NSLayoutConstraint.activate([
            loginBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loginBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            loginBtn.heightAnchor.constraint(equalToConstant: 60),
            loginBtn.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
}
