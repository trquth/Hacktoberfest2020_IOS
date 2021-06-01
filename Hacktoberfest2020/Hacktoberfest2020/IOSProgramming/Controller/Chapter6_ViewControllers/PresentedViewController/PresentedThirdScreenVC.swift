//
//  PresentedThirdScreenVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 20/03/2021.
//

import UIKit

class PresentedThirdScreenVC: UIViewController, PresentedSecondExtraScreenDelegate {
    func accept(data: Any) {
        print(#function)
        print(data)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        print(self.modalPresentationStyle.rawValue)
    }
    
    @IBAction func doPresent(_ sender: Any) {
        print("\(#function) presenting \(self.presentingViewController as Any)")
        print("\(#function) presented \(self.presentedViewController as Any)")
        
        let svc = PresentedSecondExtraScreenVC()
        svc.delegate = self
        svc.modalTransitionStyle  = .flipHorizontal
        self.view.window?.backgroundColor = .green
        
        print("\(#function) trait collection \(self.traitCollection)")
        svc.modalPresentationStyle = .fullScreen
        
        self.present(svc, animated: true)
       
    }

}

extension PresentedThirdScreenVC : UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        print("hey, stop that")
    }
    
}
