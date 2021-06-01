//
//  SecondScreenOfPresentedVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 20/03/2021.
//

import UIKit

class PresentedSecondScreenVC: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.transitioningDelegate = self
        
        if self.traitCollection.userInterfaceIdiom == .phone {
            self.modalPresentationStyle = .custom
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func closeBtn(_ sender: Any) {
        print("\(#function) \(self.presentingViewController)")
        self.presentingViewController?.dismiss(animated: true)
    }
}

extension PresentedSecondScreenVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let pc = MyPresentationVC(presentedViewController: presented, presenting: presenting)
        return pc
    }
}

class MyPresentationVC: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect{
        return super.frameOfPresentedViewInContainerView.insetBy(dx: 40, dy: 40)
    }
}

extension MyPresentationVC {
    override func presentationTransitionWillBegin() {
        
//        let con = self.containerView!
//        let shadow = UIView(frame: con.bounds)
//        shadow.backgroundColor = UIColor(white: 0, alpha: 0.4)
//        con.insertSubview(shadow, at: 0)
//        shadow.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        if let tc = self.presentingViewController.transitionCoordinator {
//            
//        }
    }
    
    override func dismissalTransitionWillBegin() {
        
    }
}

