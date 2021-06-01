//
//  PresentedSecondExtraScreenVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 20/03/2021.
//

import UIKit

protocol PresentedSecondExtraScreenDelegate: AnyObject {
    func accept(data: Any)
}

class PresentedSecondExtraScreenVC: UIViewController {

    var data: Any?
    weak var delegate : PresentedSecondExtraScreenDelegate?
    
    @IBAction func close(_ sender: Any) {
        //self.presentingViewController?.dismiss(animated: true)
        print("\(#function)")
        print(self.presentingViewController)
        print(self.presentingViewController?.presentedViewController as Any)
        
        let vc = self.delegate as! UIViewController
        print(vc.presentedViewController as Any)
        self.delegate?.accept(data: "Pass data")
        
        self.dismiss(animated: true)
    }
}
