//
//  GroupFeedVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 09/07/2021.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var sendBtnView: UIView!
    
    var group: Group?
    var groupMessages = [Message]()
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sendBtnView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmails(forGroup: group!) { returnedEmail in
            self.membersLbl.text = returnedEmail.joined(separator: " ,")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { snapshot in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!) { returnedGroupMessages in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            }
        }
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: group?.key) { success in
                if success {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            }
        }
    }
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "groupFeedCell", for: indexPath) as! GroupFeedCell
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { email in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email ?? "", content: message.content)

        }
        return cell
    }
}

