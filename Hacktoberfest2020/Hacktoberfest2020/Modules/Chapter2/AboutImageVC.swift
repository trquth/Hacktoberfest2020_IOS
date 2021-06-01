//
//  AboutImageVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/21/20.
//

import UIKit

class AboutImageVC: UIViewController {
    
    let bearMan : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "costume")
        return imageView
    }()
    
    let milk : UIImageView = {
        let imageView = UIImageView()
//        if let path = Bundle.main.path(forResource: "milk", ofType: "png"){
//            imageView.image = UIImage(contentsOfFile: path)
//        }
        imageView.image = UIImage(named: "milk")
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.orange.cgColor
        
        print(imageView.clipsToBounds)
        print(imageView.contentMode.rawValue)
        
        return imageView
    }()
    
    let button  : UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "flower")
        image?.withRenderingMode(.alwaysOriginal)
        //image?.withTintColor(.red)
        //image?.withTintColor(.orange, renderingMode: .alwaysTemplate)
       // print(image?.renderingMode.rawValue)
        //mage?.withTintColor(.orange)
        //button.tintColor = .orange
        
        //button.setBackgroundImage(image, for: .normal)
        button.setImage(image?.withAlignmentRectInsets(UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)), for: .normal)
        
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        
        button.setTitle("FLOWER", for: .normal)
        //button.sizeToFit()

        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        view.addSubview(bearMan)
        bearMan.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([bearMan.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     bearMan.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),])
        
        view.addSubview(milk)
        milk.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([milk.centerXAnchor.constraint(equalTo: self.bearMan.centerXAnchor),
                                     milk.topAnchor.constraint(equalTo: self.bearMan.bottomAnchor, constant: 70),
                                     milk.widthAnchor.constraint(equalToConstant: 80),
                                     milk.heightAnchor.constraint(equalToConstant: 80)])
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: self.milk.centerXAnchor),
                                     button.topAnchor.constraint(equalTo: self.milk.bottomAnchor, constant: 70),
                                     button.widthAnchor.constraint(equalToConstant: 180),
                                     button.heightAnchor.constraint(equalToConstant: 80)])
        
    }
}
