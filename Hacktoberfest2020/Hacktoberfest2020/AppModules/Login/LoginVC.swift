//
//  LoginVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/28/20.
//

import UIKit

class LoginVC: UIViewController {
    
    let headerBackground : UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "pattern-1"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let welcomeLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        let attributes = NSMutableAttributedString(string: "Xin chào, \n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30)])
        attributes.append(NSAttributedString(string: "Nhập số điện thoại để tiếp tục", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))
        label.textAlignment = .center
        label.attributedText = attributes
        return label
    }()
    
    let anotherWayLoginLbl : UILabel = {
        let lbl = UILabel()
        let attributes = NSMutableAttributedString(string: "Hoặc đăng nhập bằng", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)])
        lbl.attributedText = attributes
        lbl.textAlignment = .center
        return lbl
    }()
    
    let emailBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 20
        btn.setTitle("Email", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemOrange
        
        return btn
    }()
    
    let facebookBtn : UIButton = {
        let btn = UIButton(type: .system)
        //btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        print("fbBtn height",btn.frame)
        btn.layer.cornerRadius = 20
        btn.setTitle("Facebook", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        
        return btn
    }()
    
    let cancelBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Cancel", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()
    
    let chooseNationPopup : ChooseNationPopUp = {
        let popup = ChooseNationPopUp()
        popup.translatesAutoresizingMaskIntoConstraints = false
        popup.layer.cornerRadius = 10
        return popup
    }()
    
    let phoneNumberInput : PhoneNumberInput = {
        let input = PhoneNumberInput()
        input.isDisabledInput = true
        return input
    }()
    
    @objc func doAction(_ sender:UITapGestureRecognizer){
        print("do")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseNationPopup.delegate = self
        phoneNumberInput.delegate = self
        
        configureView()
    }
    
    //MARK : Handle
    
    func openPopUp(){
        view.addSubview(chooseNationPopup)
        
        print("chooseNationPopup frame", chooseNationPopup.bounds)
        
        NSLayoutConstraint.activate([
            chooseNationPopup.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            chooseNationPopup.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            chooseNationPopup.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            chooseNationPopup.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
        
        UIView.animate(withDuration: 0.3){
            
        }
    }
    
    func configureView(){
        view.addSubview(headerBackground)
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLbl)
        welcomeLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneNumberInput)
        phoneNumberInput.translatesAutoresizingMaskIntoConstraints = false
//        let gesture = UIGestureRecognizer(target: self, action: #selector(doAction))
//        phoneNumberInput.addGestureRecognizer(gesture)
        view.addSubview(anotherWayLoginLbl)
        anotherWayLoginLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cancelBtn)
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
            
        let buttonStackView = UIStackView(arrangedSubviews: [facebookBtn, emailBtn])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 20
        
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 170)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            welcomeLbl.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            phoneNumberInput.topAnchor.constraint(equalTo: welcomeLbl.bottomAnchor, constant: 20),
            phoneNumberInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            phoneNumberInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            buttonStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        print("stack frame",buttonStackView.bounds)
        
 
        NSLayoutConstraint.activate([
            anotherWayLoginLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            anotherWayLoginLbl.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            cancelBtn.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            cancelBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30),
            cancelBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    //MARK : Selector
    
    
}

extension LoginVC : ChooseNationPopUpDelegate , PhoneNumberInputDelegate{
    func onPressPhoneNumberInput() {
        print("do")
    }
    
    func openChooseNationPopUp() {
        openPopUp()
    }
    
    func closeChooseNationPopUp() {
        UIView.animate(withDuration: 0.3, animations: {
        }, completion: { _ in self.chooseNationPopup.removeFromSuperview()})
    }
    
    
}
