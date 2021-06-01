//
//  FirstScreenOfPresentedVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 20/03/2021.
//

import UIKit

class PresentedFirstScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func doPresent(_ sender: Any) {
        let vc = PresentedExtraScreenVC()
//        self.definesPresentationContext = true
//        self.providesPresentationContextTransitionStyle = true
//        self.modalTransitionStyle = .flipHorizontal
        //vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .currentContext
        vc.modalPresentationCapturesStatusBarAppearance = false
        self.present(vc, animated: true)
    }
}
