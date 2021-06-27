//
//  GoalsVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 25/06/2021.
//

import UIKit
import CoreData

var appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var goals: [Goal] =  []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = false
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("🚀 \(#function)")
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    func fetchCoreDataObjects() {
        print("🚀 \(#function)")
        fetch { finish in
            if finish {
                if goals.count >= 1 {
                    self.tableView.isHidden = false
                }else{
                    self.tableView.isHidden = true
                }
            }
        }
    }
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}
        //present(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        presentDetail(viewControllerToPresent: vc)
    }
}


extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as! GoalCell
        let goal = goals[indexPath.row]
        cell.configureCell(goal)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //Don't work ?????!!!!!
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { rowAction, indexPath in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { rowAction, indexPath in self.setProgress(atIndexPath: indexPath)
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.9385011792, green: 0.7164435983, blue: 0.3331357837, alpha: 1)
       
        return [deleteAction, addAction]
    }
}

extension GoalsVC {
    func fetch(complete: (_ finish: Bool) ->()) {
        print("🚀 \(#function)")
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            goals = try managedContext.fetch(fetchRequest)
            complete(true)
            print("Successfully fetch goal")
            
        } catch  {
            debugPrint("Could not fetch ERROR \(error.localizedDescription)")
            complete(false)
        }
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        print("🚀 \(#function)")
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        managedContext.delete(goals[indexPath.row])
        
        do {
             try managedContext.save()
            print("Successfully remove goal 😋")
        } catch  {
            print("Could not remove ERROR \(error.localizedDescription)")
        }
    }
    
    func setProgress( atIndexPath indexPath: IndexPath) {
        print("🚀 \(#function)")
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        }else{
            return
        }
        do {
             try managedContext.save()
            print("Successfully update goal 😋")
        } catch  {
            print("Could not update ERROR \(error.localizedDescription)")
        }
      
    }
}
