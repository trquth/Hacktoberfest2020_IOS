//
//  GoalCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/06/2021.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    func configureCell(_ goal: Goal){
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
        print(goal.goalProgress == goal.goalCompletionValue)
        print(goal.goalProgress)
        print(goal.goalCompletionValue)
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden =  false
        }else{
            self.completionView.isHidden = true
        }
    }
}
