//
//  CommentCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/07/2021.
//

import UIKit
import FirebaseAuth

protocol CommentDelegate {
    func commentOptionsTapped(comment: Comment)
}

class CommentCell: UITableViewCell {
    @IBOutlet weak var usernameTxt: UILabel!
    @IBOutlet weak var timestampTxt: UILabel!
    @IBOutlet weak var commentTxt: UILabel!
    @IBOutlet weak var optionMenu: UIImageView!
    
    var comment: Comment!
    var delegate: CommentDelegate?
    
    func configureCell(comment: Comment, delegate: CommentDelegate?) {
        optionMenu.isHidden = true
        self.comment = comment
        self.delegate = delegate
        usernameTxt.text = comment.username
        commentTxt.text = comment.commentTxt
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: comment.timestamp)
        timestampTxt.text = timestamp
        
        if comment.userId == Auth.auth().currentUser?.uid {
            optionMenu.isHidden = false
            optionMenu.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(commentOptionsTapped))
            optionMenu.addGestureRecognizer(tap)
        }
    }
    
    @objc func commentOptionsTapped(){
        delegate?.commentOptionsTapped(comment: comment)
    }
}
