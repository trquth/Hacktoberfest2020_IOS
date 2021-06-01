//
//  NetworkingTabBar.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 01/03/2021.
//

import UIKit

class NetworkingTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTab = UINavigationController(rootViewController: WeatherVC(nibName: "WeatherVC", bundle: nil))
        firstTab.title = "Weather"
        let secondTab = UINavigationController(rootViewController: StatesListVC())
        
        viewControllers = [firstTab]
    }

}
