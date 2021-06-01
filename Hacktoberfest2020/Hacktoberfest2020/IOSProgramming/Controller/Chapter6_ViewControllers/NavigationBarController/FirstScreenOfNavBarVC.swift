//
//  FirstScreenOfNavBarVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 18/03/2021.
//

import UIKit

class FirstScreenOfNavBarVC: UIViewController, UINavigationControllerDelegate {
    
    override func awakeFromNib() {
        self.title = "First Screen"
        let b = UIBarButtonItem(image: UIImage(named: "key"), style: .plain, target: self, action: nil)
        let b2 = UIBarButtonItem(image: UIImage(named: "files"), style: .plain, target: self, action: #selector(goToNextScreen))
        self.navigationItem.rightBarButtonItems = [b,b2]
        self.navigationItem.backButtonTitle = "Files"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationController?.delegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let app = UINavigationBarAppearance()
//        app.backgroundColor = UIColor.blue
//        app.backgroundColor = app.backgroundColor?.withAlphaComponent(0.7)
        
        app.backgroundEffect = UIBlurEffect(style: .extraLight)
        
        if let nav = self.navigationController{
            print("run run")
            //nav.navigationBar.standardAppearance = app
            nav.navigationBar.scrollEdgeAppearance = app
            nav.navigationBar.barStyle = .black
            nav.setNavigationBarHidden(false, animated: true)
        }
        
        
        //********************************BUTTON ITEM ACTION AND MENU*********************************
        let b1: UIBarButtonItem = {
            let action1 = UIAction(title: "Surprise"){
                _ in print("tap Surprise")
            }
            
            let menu = UIMenu(title: "", image: nil, identifier: nil, children: [action1])
            //return UIBarButtonItem(title: "Long", image: nil, primaryAction: action1, menu: menu)
            //return UIBarButtonItem(title: "Short", menu: menu)// 1st way
            let b = UIBarButtonItem(title: "Short", style: .plain, target: self, action: nil)//2nd way
            b.menu = menu
            return b
        }()
        
        self.navigationItem.rightBarButtonItems = [b1]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @objc func goToNextScreen(){
        print(#function)
        let secondScreen = SecondScreenOfNavBarVC()
        self.navigationController?.pushViewController(secondScreen, animated: true)
    }
    
    @objc func tap(){
        print(#function)
        
    }
}
