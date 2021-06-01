//
//  LoginVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/9/20.
//

import UIKit

class Login2VC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
    }
    
    // MARK : View
    let userNameLabel : UILabel = {
        let userNameLabel = UILabel()
        let attributes = NSMutableAttributedString(string: "Username", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        userNameLabel.attributedText = attributes
        return userNameLabel
    }()
    let userNameInput : CustomizeTextField = {
        let input = CustomizeTextField()
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.lightGray.cgColor
        input.layer.cornerRadius = 5
        input.placeholder = "Username"
        
        input.translatesAutoresizingMaskIntoConstraints = false
        input.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return input
    }()
    
    let passwordLabel : UILabel = {
        let label = UILabel()
        let attributes = NSMutableAttributedString(string: "Password", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        label.attributedText = attributes
        return label
    }()
    
    let passwordInput : CustomizeTextField = {
        let input = CustomizeTextField()
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.lightGray.cgColor
        input.layer.cornerRadius = 5
        //input.borderStyle = .line
        let hideIcon = UIImage(named: "hide_icon")
        let hideIconView = UIImageView(frame: CGRect(origin: CGPoint(x: 8, y: 8), size: CGSize(width: 20, height: 20)))
        hideIconView.image = hideIcon
        hideIconView.contentMode = .scaleAspectFit
        //hideIconView.backgroundColor = .red
        
        let rightIconContainerView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 35, height: 35)))
        rightIconContainerView.addSubview(hideIconView)
        //rightIconContainerView.backgroundColor = .blue

        input.rightViewMode = .always
        input.rightView = rightIconContainerView
        
        let leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10, height: 1)))
        input.leftViewMode = .always
        input.leftView = leftView
        
        input.isSecureTextEntry = true
        input.placeholder = "Password"
        input.translatesAutoresizingMaskIntoConstraints = false
        input.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
        return input
    }()
    
    let logo : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "hide_icon"))
        return image
    }()
    
    let loginButton : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 5
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .lightGray
        return button
    }()
    
    func configureViews()  {
        
//        view.addSubview(logo)
//        logo.translatesAutoresizingMaskIntoConstraints = false
//        logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        logo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
    
        
        let userNameStack = UIStackView(arrangedSubviews: [userNameLabel, userNameInput])
        userNameStack.axis = .vertical
        userNameStack.distribution = .fillEqually
        userNameStack.spacing = 1;
        view.addSubview(userNameStack)
        userNameStack.translatesAutoresizingMaskIntoConstraints = false;
        let userNameStackConstraints = [
            userNameStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            userNameStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            userNameStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:  -100),
            userNameStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(userNameStackConstraints)
        
        let passwordStack = UIStackView(arrangedSubviews: [passwordLabel, passwordInput])
        passwordStack.axis = .vertical
        passwordStack.distribution = .fillEqually
        passwordStack.spacing = 1
        self.view.addSubview(passwordStack)
        passwordStack.translatesAutoresizingMaskIntoConstraints = false
        
        let passwordStackConstraints = [
            passwordStack.leadingAnchor.constraint(equalTo: userNameStack.leadingAnchor),
            passwordStack.trailingAnchor.constraint(equalTo: userNameStack.trailingAnchor),
            passwordStack.topAnchor.constraint(equalTo: userNameStack.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(passwordStackConstraints)
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonConstraints = [
            loginButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(buttonConstraints)
        
    }
    
}
