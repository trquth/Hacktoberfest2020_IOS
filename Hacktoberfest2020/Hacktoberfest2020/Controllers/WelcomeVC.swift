//
//  ViewController.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/9/20.
//

import UIKit
import CLTypingLabel

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var titleLbl: CLTypingLabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = "⚡️FlashChat"
//        let title = "⚡️FlashChat"
//        var count = 0.0
//        for character in title {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * count, repeats: false){
//                _ in
//                self.titleLbl.text?.append(character)
//            }
//            count += 1
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.isNavigationBarHidden = false
    }
    
}

