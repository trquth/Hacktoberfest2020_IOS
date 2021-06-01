//
//  AppTabBarVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 11/13/20.
//

import UIKit

class MainTabBarController : UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewTabBar()
    }
    
    func configViewTabBar(){
        let accountNav = UINavigationController(rootViewController: AccountSettingVC())
        accountNav.tabBarItem.image = #imageLiteral(resourceName: "resources_images_icons_ic_person_24px_black")
        accountNav.tabBarItem.selectedImage = #imageLiteral(resourceName: "resources_images_icons_ic_person_24px_organce")
        accountNav.navigationBar.tintColor = .orange
        accountNav.tabBarItem.title = "Tài khoản"
        
        
        viewControllers = [accountNav]
    }
}
