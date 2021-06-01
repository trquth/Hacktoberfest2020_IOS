//
//  PresentedExtraScreenVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 20/03/2021.
//

import UIKit

class PresentedExtraScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
