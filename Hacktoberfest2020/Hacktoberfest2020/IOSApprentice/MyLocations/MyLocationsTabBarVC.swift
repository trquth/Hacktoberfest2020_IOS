//
//  MyLocationsTabBarVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 14/12/2020.
//

import UIKit

class MyLocationsTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTab = UINavigationController(rootViewController: SearchContainerWithTableVC())
        firstTab.title = "Tag"
        let secondTab = UINavigationController(rootViewController: CurrentLocationVC())
        
        viewControllers = [firstTab]
    }

}
