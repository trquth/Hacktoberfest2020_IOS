//
//  EditLootLoggerVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 30/11/2020.
//

import UIKit

class LootLoggerDetailVC: UIViewController {
    
   static func createLabel(title: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.attributedText = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
        return lbl
    }
    
    static func createInput() -> UITextField {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.lightGray.cgColor
        input.layer.cornerRadius = 5
        
        return input
    }
    
    let nameLbl : UILabel = {
        return createLabel(title: "Name")
    }()
    
    let nameInput : UITextField = {
        let input = createInput()
        return input
    }()
    
    let serialLbl : UILabel = {
        return createLabel(title: "Serial")
    }()
    
    let serialInput : UITextField = {
        let input = createInput()
        return input
    }()
    
    let valueLbl : UILabel = {
        return createLabel(title: "Value")
    }()
    
    let valueInput : UITextField = {
        let input = createInput()
        return input
    }()
    
    var item : Item!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameInput.text = item.name
        serialInput.text =  item.serialNumber
        valueInput.text = "\(item.valueInDollars)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()

    }
    
    func configView()  {
        let inputNameStackView = UIStackView(arrangedSubviews: [nameLbl, nameInput])
        inputNameStackView.translatesAutoresizingMaskIntoConstraints = false
        inputNameStackView.distribution = .fillEqually
        view.addSubview(inputNameStackView)
        
        let inputSerialStackView = UIStackView(arrangedSubviews: [serialLbl, serialInput])
        inputSerialStackView.translatesAutoresizingMaskIntoConstraints = false
        inputSerialStackView.distribution = .fillEqually
        view.addSubview(inputSerialStackView)
        
        let inputValueStackView = UIStackView(arrangedSubviews: [valueLbl, valueInput])
        inputValueStackView.translatesAutoresizingMaskIntoConstraints = false
        inputValueStackView.distribution = .fillEqually
        view.addSubview(inputValueStackView)
        
        NSLayoutConstraint.activate([
            inputNameStackView.heightAnchor.constraint(equalToConstant: 35),
            inputNameStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            inputNameStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            inputNameStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            inputSerialStackView.heightAnchor.constraint(equalToConstant: 35),
            inputSerialStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            inputSerialStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            inputSerialStackView.topAnchor.constraint(equalTo: inputNameStackView.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            inputValueStackView.heightAnchor.constraint(equalToConstant: 35),
            inputValueStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            inputValueStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            inputValueStackView.topAnchor.constraint(equalTo: inputSerialStackView.bottomAnchor, constant: 10)
        ])
    }

}
