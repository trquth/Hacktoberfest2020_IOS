//
//  ThoughtCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/07/2021.
//

import UIKit
import Firebase
import FirebaseAuth

protocol ThoughtDelegate {
    func thoughtOptionsTapped(thought: Thought)
}

class ThoughtCell: UITableViewCell {

    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTextLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!
    @IBOutlet weak var commentsNumLbl: UILabel!
    @IBOutlet weak var optionsMenu: UIImageView!

    private var thought: Thought!
    private var delegate: ThoughtDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        likesImg.addGestureRecognizer(tap)
        likesImg.isUserInteractionEnabled = true
    }
    
    @objc func likeTapped(){
        print(#function)
        //Method 1
//        Firestore.firestore()
//            .collection(THOUGHTS_REF)
//            .document(thought.documentId)
//            .setData([NUM_LIKES : thought.numLikes + 1], merge: true)
        //Method 2
        Firestore.firestore().document("thoughts/\(thought.documentId!)")
        .updateData([NUM_LIKES : thought.numLikes + 1])
    }

    func configCell(thought: Thought, delegate: ThoughtDelegate?)  {
        optionsMenu.isHidden = true
        self.thought = thought
        self.delegate = delegate 
        userNameLbl.text = thought.username
        //timestampLbl.text = thought.timeStamp
        thoughtTextLbl.text = thought.thoughtTxt
        likesNumLbl.text = String(thought.numLikes)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: thought.timestamp)
        timestampLbl.text = timestamp
        
        if thought.userId == Auth.auth().currentUser?.uid {
            optionsMenu.isHidden = false
            optionsMenu.isUserInteractionEnabled = true
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(thoughtOptionsTapped))
            optionsMenu.addGestureRecognizer(tap)
        }
    }
    
    @objc func thoughtOptionsTapped(){
        delegate?.thoughtOptionsTapped(thought: thought)
    }

}
