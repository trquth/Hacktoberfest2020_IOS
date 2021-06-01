//
//  GuessTheFlagVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 21/11/2020.
//

import UIKit

class GuessTheFlagVC: UIViewController {
    
   static func createFlagButton(flagImage : UIImage) -> UIButton {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        
        button.setImage(flagImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false;
        
        return button
    }
    
    let flag1Btn : UIButton = {
        let btn = createFlagButton(flagImage: #imageLiteral(resourceName: "us") )
        btn.addTarget(self, action: #selector(selectFlag), for: .touchUpInside)
        return btn
    }()
    
    let flag2Btn : UIButton = {
        let btn = createFlagButton(flagImage: #imageLiteral(resourceName: "uk") )
        btn.tag = 1
        btn.addTarget(self, action: #selector(selectFlag), for: .touchUpInside)
        return btn
    }()
    
    let flag3Btn : UIButton = {
        let btn = createFlagButton(flagImage: #imageLiteral(resourceName: "ireland") )
        btn.tag = 2
        btn.addTarget(self, action: #selector(selectFlag), for: .touchUpInside)
        return btn
    }()
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        configView()
        askQuestion()
    }
    
    //MARK: - Handler
    
    func initData() {
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    func configView() {
        let flagsStackView = UIStackView(arrangedSubviews: [flag1Btn,flag2Btn,flag3Btn])
        flagsStackView.spacing = 20
        flagsStackView.distribution = .fill
        flagsStackView.axis = .vertical
        view.addSubview(flagsStackView)
        flagsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagsStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            flagsStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    func askQuestion(action : UIAlertAction! = nil) {
        countries.shuffle()

        flag1Btn.setImage(UIImage(named: countries[0]), for: .normal)
        flag2Btn.setImage(UIImage(named: countries[1]), for: .normal)
        flag3Btn.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        self.title = countries[correctAnswer].uppercased()
    }
    
    @objc func selectFlag(_ sender : UIButton){
        print(sender.tag)
        var title : String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }else{
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }

}
