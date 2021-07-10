//
//  LoginVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/07/2021.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createUserBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginBtn.layer.cornerRadius = 10
        createUserBtn.layer.cornerRadius = 10
    }

    @IBAction func loginBtnTapped(_ sender: Any) {
        guard let email = emailTxt.text, let password = passwordTxt.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error {
                print("Could not sign in \(error.localizedDescription)")
            }else{
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        
    }
    
    @IBAction func createUserBtnTapped(_ sender: Any) {
    }
}
