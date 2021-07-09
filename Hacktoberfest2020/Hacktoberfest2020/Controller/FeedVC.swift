//
//  FeedVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 06/07/2021.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DataService.instance.getAllFeedMessages { messages in
            self.messageArray = messages
            self.tableView.reloadData()
        }
        
    }

}

extension FeedVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCellId", for: indexPath) as! FeedCell
        let message = self.messageArray[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { email in
            if let receivedEmail = email {
                cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: receivedEmail, content: message.content)

            }else{
                cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: "", content: message.content)

            }
        }
        return cell
        
    }
    
}
