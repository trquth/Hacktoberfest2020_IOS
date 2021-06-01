//
//  IOSProgrammingTabVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/12/2020.
//

import UIKit

class IOSProgrammingTabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstTab = UINavigationController(rootViewController: TabBarVC(nibName: "TabBarVC", bundle: nil))
        firstTab.title = "COLLECTION VIEWS"
        let secondTab = UINavigationController(rootViewController: StatesListVC())
        
        viewControllers = [firstTab]
    }

}
