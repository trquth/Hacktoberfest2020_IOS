//
//  ContentInsetDemoVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 01/04/2021.
//

import UIKit

class ContentInsetDemoVC: UIViewController, UINavigationControllerDelegate {

    var sv : UIScrollView!
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        if let nav = navigationController?.navigationBar {
//            print(ContentInsetDemoVC.self)
//            print(#function)
//            nav.barTintColor = .blue
//            nav.titleTextAttributes = [.foregroundColor : UIColor.white]
//        }
//
//    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demo scroll view"
        
    
        print("*********************🌻🌻 NAVIGATION BAR FOR A SCREEN 🌻🌻**********************")
        self.navigationController?.delegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let app = UINavigationBarAppearance()
        app.backgroundColor = .orange
        app.titleTextAttributes = [.foregroundColor: UIColor.white]
        app.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationController?.navigationBar.standardAppearance = app
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
        
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.white]

        self.navigationController?.navigationBar.barStyle = .black
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sv.topAnchor.constraint(equalTo: self.view.topAnchor),
            sv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let svclg = sv.contentLayoutGuide
        var previousLbl : UILabel?
        for i in 0 ..< 30 {
            let lbl = UILabel()
            lbl.text = "This is #\(i + 1)"
            lbl.textColor = .white
            lbl.translatesAutoresizingMaskIntoConstraints = false
            sv.addSubview(lbl)
            
            lbl.leadingAnchor.constraint(equalTo: svclg.leadingAnchor).isActive = true
            lbl.topAnchor.constraint(equalTo: previousLbl?.bottomAnchor ?? svclg.topAnchor, constant: 10).isActive = true
            
            previousLbl = lbl
        }
        
        previousLbl?.bottomAnchor.constraint(equalTo: svclg.bottomAnchor).isActive = true
//        previousLbl?.trailingAnchor.constraint(equalTo: svclg.trailingAnchor).isActive = true
        //Result contentSize (84.0, 910.0)
        
        let svflg = sv.frameLayoutGuide
        svclg.widthAnchor.constraint(equalTo: svflg.widthAnchor).isActive = true
        //Result contentSize (375.0, 910.0)
        
        sv.delegate = self
        
        delay(2){
            print(#function)
            print(sv.contentSize)
            print(sv.contentOffset)
        }

    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        print("run preferredStatusBarStyle")
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

//extension UINavigationController {
//    override open var childForStatusBarStyle: UIViewController? {
//        return topViewController
//    }
//}

extension ContentInsetDemoVC : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("*********************🏃🏃🏃🏃🏃************************")
        print(#function )
        print(scrollView.contentOffset)
        print("*********************🧍🧍🧍🧍🧍🧍*******************")
    }
    
    
}


