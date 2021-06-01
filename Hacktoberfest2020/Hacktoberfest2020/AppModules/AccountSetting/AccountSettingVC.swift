//
//  AccountSettingVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 11/14/20.
//

import UIKit

class AccountSettingVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
                
        initView()
    }
    
    func initView()  {
        navigationController?.navigationBar.isHidden = true
        tableView.register(AccountHeader.self, forHeaderFooterViewReuseIdentifier: "Header")
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") else {
            return UIView()
        }
        return header
    }
    
}
