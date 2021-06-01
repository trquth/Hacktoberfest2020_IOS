//
//  TextViewAndKeyboardVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/01/2021.
//

import UIKit

class TextViewAndKeyboardVC: UIViewController {

    @IBOutlet weak var tv: UITextView!
    var sv : UIScrollView! {
        return self.tv
    }
    
    var oldContentInset = UIEdgeInsets.zero
    var oldIndicatorInset  = UIEdgeInsets.zero
    var oldOffset = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TextView and Keyboard"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doDone))
        
        let path = Bundle.main.path(forResource: "voz", ofType: "txt")
        let s = try! String(contentsOfFile: path!)
        let s2 = s.replacingOccurrences(of: "\n", with: "")
        let mas = NSMutableAttributedString(string: s, attributes: [.font : UIFont(name: "GillSans", size: 20)!])
        mas.addAttribute(.paragraphStyle, value: lend(){
                            (para : NSMutableParagraphStyle) in
                            para.alignment = .left
            para.lineBreakMode = .byWordWrapping
        }, range: NSMakeRange(0, 1))
        self.tv.attributedText = mas
        self.tv.keyboardDismissMode = .interactive
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardShow(_ n : Notification){
        
    }
    
    @objc func keyboardHide(_ n: Notification){
        
    }
    
    @objc func doDone(_ sender : Any){
        self.view.endEditing(false)
    }

}
