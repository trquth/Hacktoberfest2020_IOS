//
//  NavBarVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 03/02/2021.
//

import UIKit

class NavBarVC: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        do{
            let size = CGSize(1, 1)
            let  r = UIGraphicsImageRenderer(size: size)
            self.navBar.setBackgroundImage(r.image{
                ctx in
                UIColor.orange.withAlphaComponent(0.5).setFill()
                ctx.fill(CGRect(0, 0, 1, 1))
            }, for: .any, barMetrics: .default)
            
            self.navBar.shadowImage = r.image{
                ctx in
                UIColor.red.withAlphaComponent(0.5).setFill()
                ctx.fill(CGRect(0, 0, 1, 1))
                UIColor.red.withAlphaComponent(0.15).setFill()
                ctx.fill(CGRect(0, 2, 1, 1))
            }
        }
        self.navBar.isTranslucent = true
        
        let navBarItem = UINavigationItem(title: "NavBar Demo")
        let btn = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(pushNext))
        navBarItem.rightBarButtonItem = btn
        self.navBar.items = [navBarItem]
    }
    
    @objc func pushNext(_ sender: Any){
        let rightBarButton = sender as! UIBarButtonItem
        let title = rightBarButton.title!
        let newNavBarItem = UINavigationItem(title: title)
        if title == "Add" {
            let newRightBarBtn = UIBarButtonItem(title: "Change", style: .plain, target: self, action: #selector(pushNext))
            newNavBarItem.rightBarButtonItem = newRightBarBtn
        }
        self.navBar.pushItem(newNavBarItem, animated: true)
    }
}

extension NavBarVC: UINavigationBarDelegate{
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
