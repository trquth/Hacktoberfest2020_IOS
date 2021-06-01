//
//  LoginByEmailVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 11/13/20.
//

import UIKit

class Input : UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        print("textRect",bounds)
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        print("placeholderRect",bounds)
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        print("editingRect",bounds)
        return bounds.inset(by: padding)
    }
}

class LoginByEmailVC: UIViewController {
    
    let welcomeUserLbl : UILabel = {
        let lbl = UILabel()
        let pStyle = NSMutableParagraphStyle()
        pStyle.lineSpacing = 5
        let attributes = NSMutableAttributedString(string: "Chào bạn,\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 24),NSAttributedString.Key.paragraphStyle : pStyle])
        attributes.append(NSMutableAttributedString(string: "Nhập email để đăng nhập", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), ]))
        lbl.attributedText = attributes
        lbl.numberOfLines = 2
        
        return lbl
    }()
    
    let emailInput : Input = {
        let input = Input()

        input.layer.cornerRadius = 5
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.lightGray.cgColor
        
        
        input.frame.size.height = 40
        print("email",input.frame)

    
        input.placeholder = "Email của bạn"
        
        return input
    }()
    
    let passwordInput : Input = {
        let input = Input()

        input.layer.cornerRadius = 5
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.lightGray.cgColor
        
        print("email",input.frame)
        input.isSecureTextEntry = true
        input.placeholder = "Mật khẩu của bạn"
        
        return input
    }()
    
    let forgotPasswordBtn : UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(NSAttributedString(string: "Quên mật khẩu?", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.blue]), for: .normal)
        return button
    }()
    
    let loginBtn : UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.systemOrange
        button.setAttributedTitle(NSAttributedString(string: "Tiếp tục", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configNavigationBar()
        configView()
    }
    
    
    func configView()  {
        self.view.backgroundColor = .white
        view.addSubview(welcomeUserLbl)
        welcomeUserLbl.translatesAutoresizingMaskIntoConstraints = false
        
        emailInput.translatesAutoresizingMaskIntoConstraints = false
        emailInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        passwordInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let inputStack = UIStackView(arrangedSubviews: [emailInput, passwordInput])
        inputStack.axis = .vertical
        inputStack.spacing = 20
        inputStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputStack)
        
        view.addSubview(forgotPasswordBtn)
        forgotPasswordBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginBtn)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeUserLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            welcomeUserLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            welcomeUserLbl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            inputStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            inputStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            inputStack.topAnchor.constraint(equalTo: self.welcomeUserLbl.bottomAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            forgotPasswordBtn.heightAnchor.constraint(equalToConstant: 30),
            forgotPasswordBtn.topAnchor.constraint(equalTo: inputStack.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            loginBtn.heightAnchor.constraint(equalToConstant: 40),
            loginBtn.widthAnchor.constraint(greaterThanOrEqualTo: self.view.widthAnchor, multiplier: 0, constant: 250)
        ])
    }
    
    func configNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .blue
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "node_modules_reactnavigation_src_views_assets_backicon"), style: .done, target: self, action: nil)
    }
}
