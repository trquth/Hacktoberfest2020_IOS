//
//  MainVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/07/2021.
//

import UIKit
import Firebase
import FirebaseAuth

enum ThoughtCategory : String {
    case serious = "serious"
    case funny = "funny"
    case crazy = "crazy"
    case popular = "popular"
}
class MainVC: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private var thoughts = [Thought]()
    private var thoughtsCollectionRef: CollectionReference!
    private var thoughtsListener: ListenerRegistration!
    private var selectedCategory = ThoughtCategory.funny.rawValue
    private var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = 80
//        tableView.rowHeight = UITableView.automaticDimension
        
        thoughtsCollectionRef = Firestore.firestore().collection(THOUGHTS_REF)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            print("\(#function)  👀 \(user)")
            if user == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = storyboard.instantiateViewController(identifier: "LoginVC")
                loginVC.modalPresentationStyle = .fullScreen
                self.present(loginVC, animated: true, completion: nil)
            }else {
                self.setListener()
            }
        }
        
//        thoughtsCollectionRef.getDocuments { snapshot, error in
//            if let error = error {
//                print("Error fetching docs 💥: \(error.localizedDescription)")
//            }else{
//                for document in (snapshot?.documents)! {
//                    let data = document.data()
//                    let username = data[USERNAME] as? String ?? "Anonymous"
//                    let timestamp = data[TIMESTAMP] as? Date ?? Date()
//                    let thoughtTxt = data[THOUGHT_TXT] as? String ?? ""
//                    let numLikes = data[NUM_LIKES] as? Int ?? 0
//                    let numComments = data[NUM_COMMENTS] as? Int ?? 0
//                    let documentId = document.documentID
//
//                    let newThought = Thought(username: username, timeStamp: timestamp, thoughtTxt: thoughtTxt, numLikes: numLikes, numComments: numComments, documentId: documentId)
//
//                    self.thoughts.append(newThought)
//                }
//                self.tableView.reloadData()
//            }
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if thoughtsListener != nil {
            thoughtsListener.remove()
        }
    }
    
    func setListener()  {
        if selectedCategory == ThoughtCategory.popular.rawValue {
            thoughtsListener =  thoughtsCollectionRef.whereField(CATEGORY, isEqualTo: selectedCategory)
                .order(by: NUM_LIKES,descending: true)
                .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching docs 💥: \(error.localizedDescription)")
                }else{
                    self.thoughts.removeAll()
                    self.thoughts =  Thought.parseData(snapshot: snapshot)
                    self.tableView.reloadData()
                }
            }
        }else{
            thoughtsListener = thoughtsCollectionRef.whereField(CATEGORY, isEqualTo: selectedCategory)
                .order(by: TIMESTAMP,descending: true)
                .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching docs 💥: \(error.localizedDescription)")
                }else{
                    self.thoughts.removeAll()
                    self.thoughts =  Thought.parseData(snapshot: snapshot)
                    self.tableView.reloadData()
                }
            }
        }
       
    }

    @IBAction func categoryChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny.rawValue
        case 1:
            selectedCategory = ThoughtCategory.serious.rawValue
        case 2:
            selectedCategory = ThoughtCategory.crazy.rawValue
        default:
            selectedCategory = ThoughtCategory.popular.rawValue
        }
        
        thoughtsListener.remove()
        setListener()
        
    }
    @IBAction func logoutBtnTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let error  as NSError {
            print("Could not sign out \(error.localizedDescription)")
        }
    }
}

extension MainVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoughts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thoughtCell", for: indexPath) as! ThoughtCell
        cell.configCell(thought: thoughts[indexPath.row], delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toComments", sender: thoughts[indexPath.row])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toComments" {
            if let destinationVC  = segue.destination as? CommentsVC {
                if let thought = sender as? Thought {
                    destinationVC.thought = thought
                }
            }
        }
    }
}

extension MainVC : ThoughtDelegate {
    func thoughtOptionsTapped(thought: Thought) {
        let alert = UIAlertController(title: "Delete", message: "Do you want to delete your thought?", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete Thought", style: .default) { action in
            //Wrong
//            Firestore.firestore()
//                .collection(THOUGHTS_REF)
//                .document(thought.documentId)
//                .delete { error in
//                    if let error = error {
//                        print("Could not delete \(error.localizedDescription)")
//                    }else {
//                        alert.dismiss(animated: true, completion: nil)
//                    }
//            }
        }
        let cancelAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    
}
