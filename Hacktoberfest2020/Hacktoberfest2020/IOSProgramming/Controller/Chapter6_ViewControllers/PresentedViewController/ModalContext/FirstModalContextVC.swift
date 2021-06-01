//
//  FirstModalContextVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 21/03/2021.
//

import UIKit

class FirstModalContextVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.delegate = self
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        print("first supported")
        return .landscape
    }

    @IBAction func doPresent(_ sender: Any) {
        print("run \(FirstModalContextVC.self) \(#function)")
        let vc = ModalContextExtraViewVC()
        let chooseCase = 1
        switch chooseCase {
        case 1:
            //vc.modalPresentationStyle = .overFullScreen
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .flipHorizontal
            break
        case 2:
            self.definesPresentationContext = true
            vc.modalPresentationStyle = .currentContext
            break
        case 3:
            self.definesPresentationContext = true
            self.providesPresentationContextTransitionStyle = true
            self.modalTransitionStyle = .flipHorizontal
            vc.modalPresentationStyle = .currentContext
            
            vc.modalPresentationCapturesStatusBarAppearance = true
            break
        default:
            break
        }
        self.present(vc, animated: true)
    }
}

extension FirstModalContextVC : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("\(FirstModalContextVC.self) \(#function)")
        return self.presentedViewController == nil
    }
}
