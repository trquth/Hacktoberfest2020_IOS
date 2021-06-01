//
//  WhitehouseTabBarVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/11/2020.
//

import UIKit

class WhitehouseTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTabVC = UINavigationController(rootViewController: FetchingPetitionDataVC())
        firstTabVC.tabBarItem.title = "Petitions"
        firstTabVC.tabBarItem.image = UIImage(systemName: "squares.below.rectangle")
        
        let secondTabVC = UINavigationController(rootViewController: PetitionDetailVC())
        secondTabVC.tabBarItem.title = "Petitions"
        secondTabVC.tabBarItem.image = UIImage(systemName: "doc.fill")
        
        viewControllers = [firstTabVC, secondTabVC]
        
    }
    

}
