//
//  PhoneNumberInput.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/31/20.
//

import UIKit

class PhoneNumberInput : UIView {
    
    var isDisabledInput : Bool?
    var delegate : PhoneNumberInputDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        phoneNumberInput.delegate = self
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let telephonePrefixButton : UIButton = {
        let button = UIButton(type: .system)
        
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.lightGray.cgColor
        
        let attributes = NSMutableAttributedString(string: "▾", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor : UIColor.black])
        button.setAttributedTitle(attributes, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        button.contentHorizontalAlignment = .fill
        
        if let flag = UIImage(named: "resources_images_flag_vietnam"){
            button.setImage(flag.withRenderingMode(.alwaysOriginal), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10) // padding
            button.imageView?.backgroundColor = .blue
            button.imageView?.contentMode = .scaleAspectFill
        }
       
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        button.addTarget(self, action: #selector(openPopUp), for: .touchUpInside)
        
        return button
    }()
    
    let phoneNumberInput : CustomTextInput = {
        let input = CustomTextInput()
        
        input.layer.borderWidth = 0.5
        input.layer.cornerRadius = 5
        input.layer.borderColor = UIColor.lightGray.cgColor
        
        input.placeholder = "Nhập số điện thoại"
        input.keyboardType = .decimalPad
        
        input.translatesAutoresizingMaskIntoConstraints = false
        input.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        input.addTarget(self, action: #selector(onPressInput), for: .touchDown)

        return input
    }()
    
 
 
    //MARK : Handle
    @objc func openPopUp(){
        delegate?.openChooseNationPopUp()
    }
    
    @objc func onPressInput(){
        delegate?.onPressPhoneNumberInput()
    }
    
    func configureView() {
        self.backgroundColor = .white
        let phoneNumberStack = UIStackView(arrangedSubviews: [telephonePrefixButton, phoneNumberInput])
       // phoneNumberStack.distribution = .fillEqually
        phoneNumberStack.spacing = 5
        
        addSubview(phoneNumberStack)
        phoneNumberStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            phoneNumberStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            phoneNumberStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            phoneNumberStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            phoneNumberStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
        
    }
}

extension PhoneNumberInput : UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumberInput.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneNumberInput.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let enableTextInput = isDisabledInput {
            return !enableTextInput
        }
        return true
    }
}


