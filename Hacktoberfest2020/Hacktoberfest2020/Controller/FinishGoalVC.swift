//
//  FinishGoalVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/06/2021.
//

import UIKit

class FinishGoalVC: UIViewController {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointTextField: UITextField!

    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType ) {
        goalDescription = description
        goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createGoalBtn.bindToKeyboard()
        pointTextField.delegate = self
  
    }

    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if let pointText = pointTextField.text, pointTextField.text != "" {
            save { finish in
                if finish {
                    dismiss(animated: true)
                }
            }
        }
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(complete: (_ finish: Bool) -> () ) {
        print("🚀 \(#function)")
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("Successfully save data")
            complete(true)
        } catch {
            print("Could not save Error \(error.localizedDescription)")
            complete(false)
        }
        
    }
    
}

extension FinishGoalVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}
