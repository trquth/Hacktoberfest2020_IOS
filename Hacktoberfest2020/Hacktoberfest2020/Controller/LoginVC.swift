//
//  LoginVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 04/07/2021.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passwordTextField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func signInBtnWasPressed(_ sender: Any) {
        print(#function)
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        AuthService.instance.loginUser(email: email, andPassword: password){
            (success, error) in
            if success == true {
                self.dismiss(animated: true, completion: nil)
            }else{
                print("Could not login by email and password 💥 loginUser\(String(describing: error?.localizedDescription))")
            }
            
            AuthService.instance.registerUser(email: email, andPassword: password) { success, error in
                if success == true {
                    AuthService.instance.loginUser(email: email, andPassword: password) { (success, nil) in
                        print("Successfully registered user!")
                    }
                }else {
                    print("Could not login by email and password 💥 registerUser  --> loginUser\(String(describing: error?.localizedDescription))")
                    print(String(describing: error?.localizedDescription))
                }
            }
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
