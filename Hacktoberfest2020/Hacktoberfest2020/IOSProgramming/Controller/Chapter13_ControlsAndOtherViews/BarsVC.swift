//
//  BarsVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 03/02/2021.
//

import UIKit

class BarsVC: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.backgroundColor = .yellow
        
        do{
            let r = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1))
            self.navBar.setBackgroundImage(r.image{ctx in
                UIColor.red.withAlphaComponent(0.8).setFill()
                ctx.fill(CGRect(0, 0, 1, 1))
            
            }, for: .any, barMetrics: .default)
            
            self.toolBar.setBackgroundImage(r.image(actions: {ctx in
                UIColor.blue.setFill()
                ctx.fill(CGRect(0, 0, 20, 20))
            }), forToolbarPosition: .any, barMetrics: .default)
        }
        
        do{
            let sz = CGSize(4, 4)
            let r = UIGraphicsImageRenderer(size: sz)
            self.navBar.shadowImage = r.image {ctx in
                UIColor.green.withAlphaComponent(0.3).setFill()
                ctx.fill(CGRect(0, 0, 4, 2))
                UIColor.green.withAlphaComponent(0.15).setFill()
                ctx.fill(CGRect(0, 2, 4, 2))
            }
            
            self.toolBar.setShadowImage(r.image{
                ctx in
                UIColor.red.setFill()
                ctx.fill(CGRect(0, 2, 4, 2))
            }, forToolbarPosition: .any)
        }
        
        do{
            let app = UINavigationBarAppearance()
            app.backgroundColor = .red
            navBar.standardAppearance = app
            app.backgroundColor = .blue
            navBar.compactAppearance = app
            app.backgroundColor = .brown
            navBar.scrollEdgeAppearance = app
        }
        
        self.navBar.isTranslucent = false
        self.toolBar.isTranslucent = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        let button = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        let navItem = UINavigationItem(title: "Bars Demo")
        navItem.rightBarButtonItem = button
        navItem.backButtonTitle = "Back"
        self.navBar.setItems([navItem], animated: true)
        self.navBar.pushItem(navItem, animated: true)
        
        
    }

}

extension BarsVC : UIBarPositioningDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        if bar === self.navBar {
            return .topAttached
        }
        
        if bar === self.toolBar {
            return .bottom
        }
        
        return .any
    }
}
