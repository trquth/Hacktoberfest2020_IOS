//
//  AuthVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 04/07/2021.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
            
        }
    }

    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        if let vc = loginVC {
//            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)

        }
    }
    
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    }
}
