//
//  SecondScreenOfNavBarVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 18/03/2021.
//

import UIKit

class SecondScreenOfNavBarVC: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = "Second Screen"
        let b = UIBarButtonItem(image: UIImage(named: "files"), style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = b
        self.navigationItem.leftItemsSupplementBackButton = true
        
        let r = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(goNextScreen))
        self.navigationItem.rightBarButtonItem = r
        
       let iv = UIImageView()
        iv.image = UIImage(named: "files")
        self.navigationItem.titleView = iv
        
        
        let v = UIView(frame: CGRect(0, 0, 30, 30))
        v.backgroundColor = .purple
        self.navigationItem.titleView = v
        
        let lab = UILabel()
        lab.text = "Hello"
        lab.backgroundColor = .white
        lab.translatesAutoresizingMaskIntoConstraints = false
        v.addSubview(lab)
        NSLayoutConstraint.activate([
            lab.topAnchor.constraint(equalTo: v.topAnchor, constant: 10),
            lab.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -10),
            lab.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 10),
            lab.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -10),
        ])
        
        self.navigationItem.titleView = v
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.largeTitleDisplayMode = .never
        
        self.view.backgroundColor = .cyan
        
    }
    
    @objc func goNextScreen(_:Any){
        print(#function)
        class ThirdScreenVC : UIViewController {
            override func viewDidLoad() {
                super.viewDidLoad()
                
                self.view.backgroundColor = .orange
            }
        }
        
        let nextScreen = ThirdScreenVC()
        nextScreen.title = "Third Screen"
        //nextScreen.navigationItem.title = "Third Screen"
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("run \(#function)")
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        print("run \(#function)")
    }

}
