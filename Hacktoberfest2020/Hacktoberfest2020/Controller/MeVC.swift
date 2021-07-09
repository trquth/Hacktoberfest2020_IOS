//
//  MeVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 06/07/2021.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.emailLbl.text = Auth.auth().currentUser?.email
    }

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default){_ in
            do{
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(identifier: "AuthVC") as! AuthVC
                authVC.modalPresentationStyle = .fullScreen
                self.present(authVC ,animated: true, completion: nil)
            }catch{
                print("Could not sign out 💥 \(error.localizedDescription)")
                
            }
        }
        logoutPopup.addAction(cancelAction)
        logoutPopup.addAction(okAction)
        present(logoutPopup, animated: true, completion: nil)
    }
}
