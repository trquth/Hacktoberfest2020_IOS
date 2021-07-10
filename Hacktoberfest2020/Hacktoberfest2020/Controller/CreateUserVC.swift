//
//  CreateUserVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/07/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class CreateUserVC: UIViewController {
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createBtn.layer.cornerRadius = 10
        cancelBtn.layer.cornerRadius = 10
    }
    @IBAction func createBtnTapped(_ sender: Any) {
        guard  let email = emailTxt.text,
               let password = passwordTxt.text,
               let username = usernameTxt.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("Could not create user \(error.localizedDescription)")
            }
            
            let changeRequest = user?.user.createProfileChangeRequest()
            changeRequest?.displayName = username
            
            changeRequest?.commitChanges(completion: { error in
                if let error = error {
                    print("Could not commit change \(error.localizedDescription)")
                }
            })
            
            guard let userId = user?.user.uid else {return}
            
            Firestore.firestore().collection(USERS_REF).document(userId).setData([USERNAME: username]) { error in
                if let error = error {
                    print("Could not setData \(error.localizedDescription)")
                }else{
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
        
    }
    
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
