//
//  CreateGoalVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/06/2021.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalTextView.delegate = self

        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()

    }

    @IBAction func shortBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        guard let description = goalTextView.text , goalTextView.text != "" else {
            return
        }
        
        guard  let vc = storyboard?.instantiateViewController(identifier: "FinishGoalVC") as? FinishGoalVC else {
            return
        }
        
        vc.initData(description: description, type: goalType)
        vc.modalPresentationStyle = .fullScreen
        presentingViewController?.presentSecondaryDetail(viewControllerToPresent: vc)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
}

extension CreateGoalVC :  UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
