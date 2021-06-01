//
//  GCDTabBarVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/11/2020.
//

import UIKit

class GCDTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTab = UINavigationController(rootViewController: PetitionsListVC())
        viewControllers = [firstTab]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
