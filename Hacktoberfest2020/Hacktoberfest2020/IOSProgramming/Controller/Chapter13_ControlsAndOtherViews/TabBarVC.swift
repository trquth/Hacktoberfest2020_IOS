//
//  TabBarVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 04/02/2021.
//

import UIKit

class TabBarVC: UIViewController {

    @IBOutlet weak var tabBar: UITabBar!
    
    var items: [UITabBarItem] = {
        Array(1 ..< 8).map {
            UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem(rawValue: $0)!, tag: $0)
        }
    }()
    override func viewDidLoad() {

        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        let tabBar = UITabBar()
        self.view.addSubview(tabBar)
        self.tabBar = tabBar
        self.tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tabBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tabBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tabBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        super.viewDidLoad()
        self.tabBar.items = Array(self.items[0..<4]) + [UITabBarItem(tabBarSystemItem: .more, tag: 0)]
        self.tabBar.selectedItem = self.tabBar.items![0]
        self.tabBar.delegate = self

    }

}

extension TabBarVC: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("did select item with tag \(item.tag)")
        if item.tag == 0 {
            tabBar.selectedItem = nil
            tabBar.beginCustomizingItems(self.items)
        }
    }
    
    func tabBar(_ tabBar: UITabBar, didEndCustomizing items: [UITabBarItem], changed: Bool) {
        self.tabBar.selectedItem = self.tabBar.items![0]
    }
}
