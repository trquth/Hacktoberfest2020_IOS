//
//  DialogsOnPhoneVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 27/03/2021.
//

import UIKit

class DialogsOnPhoneVC: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doType1(_ sender: Any) {
        let alert = UIAlertController(title: "Survey!!!!",
                                      message: """
                                                Should you learn Swift and iOS Programming? 🙇‍♂️
                                                Choose your answer below 👇
                                                """, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes, I like it! 👌", style: .default){
            _ in print("Choose YES")
        })
        alert.addAction(UIAlertAction(title: "Maybe! 🤔", style: .destructive){
            _ in print("Choose Maybe")
        })
        alert.addAction(UIAlertAction(title: "No, I don't like! 👎", style: .cancel){
            _ in print("Choose No")
        })
        alert.preferredAction = alert.actions[0]
       
        self.present(alert, animated: true)
    }
    
    @IBAction func doType2(_ sender: Any) {
        let alert = UIAlertController(title: "Enter a number 🔢", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: {
            tf in
            tf.keyboardType = .numberPad
            tf.addTarget(self, action: #selector(self.textChanged), for: .editingChanged)
            tf.delegate = self
        })
        
        func handler(_ act: UIAlertAction){
            let tf = alert.textFields![0]
            print("User entered \(tf.text as Any) tapped \(act.title as Any)")
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: handler))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        alert.actions[1].isEnabled = false
        self.present(alert, animated: true)
    }
    
    @IBAction func doType3(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Select your age range!", message: nil, preferredStyle: .actionSheet)
        
        func handler(_ act: UIAlertAction){
            print("Your age range is \(act.title)")
        }
        actionSheet.addAction(UIAlertAction(title: "Under 18 ages 🐣", style: .default, handler: handler))
        actionSheet.addAction(UIAlertAction(title: "Over 18 ages 🐓", style: .default, handler: handler))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: handler))
        //actionSheet.view.tintColor = .gray
        self.present(actionSheet, animated: true)
        //For iPad
        if let pop = actionSheet.popoverPresentationController {
            let v = sender as! UIView
            pop.sourceView = v
            pop.sourceRect = v.bounds
        }
        
    }
    
    @objc func textChanged(_ sender: Any){
        let tf = sender as! UITextField
        var resp : UIResponder! = tf
        //print("resp----->",resp)
        while !(resp is UIAlertController) {
            resp = resp.next
        }
        let alert = resp as! UIAlertController
        alert.actions[1].isEnabled = (tf.text != "")
        
        print("Typing ✍️ ----> \(tf.text!)")
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Dismiss keyboard 👋")
        return textField.text != ""
    }
}
