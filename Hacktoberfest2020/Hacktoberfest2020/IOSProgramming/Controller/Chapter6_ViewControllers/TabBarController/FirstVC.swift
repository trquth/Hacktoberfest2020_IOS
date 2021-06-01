//
//  FirstVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 03/03/2021.
//

import UIKit

class FirstVC: UIViewController, UITabBarControllerDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        print("run init \(FirstVC.self)")
        self.tabBarItem.selectedImage = UIImage(named: "smiley")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        print("run here \(FirstVC.self)")
        print(#function)
        return .landscape
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tabBarController?.delegate = self
        func f(){
            print("**************************************")
            let h = self.tabBarController?.tabBar.bounds.size.height
            print(h)
            let vc = self.tabBarController?.childForScreenEdgesDeferringSystemGestures
            print("child for screen edges", vc as Any)
            print("**************************************")
        }
        f()
        
        NotificationCenter.default.addObserver(forName: UIApplication.didChangeStatusBarOrientationNotification, object: nil, queue: nil){
            _ in f()
        }
    }
    

//    func tabBarControllerSupportedInterfaceOrientations(_ tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
//        print("run run \(#function)")
//        return .portrait
//    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print("horiz", self.traitCollection.horizontalSizeClass)
        print("vert", self.traitCollection.verticalSizeClass)
        super.traitCollectionDidChange(previousTraitCollection)
    }
}
