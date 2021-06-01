//
//  SocialMediaVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 21/11/2020.
//

import UIKit

class SocialMediaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configNavBar()
    }
    
    func configNavBar()  {
        title = "Share"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc func shareTapped(){
        let image = #imageLiteral(resourceName: "rubik.png")
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
