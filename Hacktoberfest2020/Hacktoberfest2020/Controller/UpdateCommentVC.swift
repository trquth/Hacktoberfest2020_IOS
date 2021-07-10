//
//  UpdateCommentVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 11/07/2021.
//

import UIKit
import Firebase

class UpdateCommentVC: UIViewController {

    @IBOutlet weak var commentTxt: UITextView!
    @IBOutlet weak var updateBtn: UIButton!
    
    var commentData: (comment: Comment, thought: Thought)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        commentTxt.layer.cornerRadius = 10
        updateBtn.layer.cornerRadius = 10
        commentTxt.text = commentData.comment.commentTxt
    }

    @IBAction func updateTapped(_ sender: Any) {
        Firestore.firestore()
            .collection(THOUGHTS_REF)
            .document(commentData.thought.documentId)
            .collection(COMMENTS_REF)
            .document(commentData.comment.documentId)
            .updateData([COMMENT_TXT : commentTxt.text]){
                error in
                if let error = error {
                    print("Could not update \(error.localizedDescription)")
                }else{
                    self.navigationController?.popViewController(animated: true) 
                }
            }
    }
}
