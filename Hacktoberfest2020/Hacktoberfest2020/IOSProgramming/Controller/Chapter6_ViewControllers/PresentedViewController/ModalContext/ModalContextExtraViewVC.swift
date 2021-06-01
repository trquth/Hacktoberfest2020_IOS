//
//  ModalContextExtraViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 21/03/2021.
//

import UIKit

class ModalContextExtraViewVC: UIViewController {
    
//    override var prefersStatusBarHidden: Bool{
//        return true
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(ModalContextExtraViewVC.self) \(self.traitCollection)")
    }

    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeLeft
    }
}
