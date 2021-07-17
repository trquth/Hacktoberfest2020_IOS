//
//  ListUsersVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 15/07/2021.
//

import UIKit

class ListUsersVC: UITableViewController {

    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getListUser()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        cell.configureCell(user: users[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userId = users[indexPath.row].id
        guard let userDetailVC = storyboard?.instantiateViewController(withIdentifier: "UserDetailVC") as? UserDetailVC else {
            return
        }
        userDetailVC.userId = userId
        self.navigationController?.pushViewController(userDetailVC, animated: true)
    }
    
    func getListUser() {
        print(#function)
        //Check internet status
        UtilVC.instance.showActivityIndicator()
        UserDataService.getListUsers(forPage: 0) { receivedData in
            UtilVC.instance.hideActivityIndicator()
            print(receivedData)
            self.users = receivedData
            self.tableView.reloadData()
        }
    }
}
