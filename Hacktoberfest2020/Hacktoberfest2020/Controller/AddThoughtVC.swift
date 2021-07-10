//
//  AddThoughtVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 09/07/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class AddThoughtVC: UIViewController {

    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var thoughtTxt: UITextView!
    @IBOutlet weak var postBtn: UIButton!
    
    private var selectedCategory = ThoughtCategory.funny.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postBtn.layer.cornerRadius = 4
        thoughtTxt.layer.cornerRadius = 4
        thoughtTxt.text = "My random thought..."
        thoughtTxt.textColor = .lightGray
        thoughtTxt.delegate = self
       
    }

    @IBAction func postBtnTapped(_ sender: Any) {
        guard let username = userNameTxt.text else {
            return
        }
        Firestore.firestore()
            .collection(THOUGHTS_REF)
            .addDocument(data: [
                            CATEGORY: selectedCategory,
                            NUM_COMMENTS: 0,
                            NUM_LIKES: 0,
                            THOUGHT_TXT: thoughtTxt.text!,
                            TIMESTAMP: FieldValue.serverTimestamp(),
                            USERNAME: username,
                            USER_ID: Auth.auth().currentUser?.uid ?? ""]) { error in
                if let error = error {
                    print("Error add document: \(error)")
                }else{
                    self.navigationController?.popViewController(animated: true)
                }
                
            }
    }
    
    @IBAction func categoryChanged(_ sender: Any) {
        switch categorySegment.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny.rawValue
        case 1:
            selectedCategory = ThoughtCategory.serious.rawValue
        default:
            selectedCategory = ThoughtCategory.crazy.rawValue
        }
        
    }
}

extension AddThoughtVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .darkGray
    }
}
