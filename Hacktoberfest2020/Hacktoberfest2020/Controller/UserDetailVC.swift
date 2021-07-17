//
//  UserDetailVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 17/07/2021.
//

import UIKit
import AlamofireImage
import Alamofire

class UserDetailVC: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    var userId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(#function)
       
        headerView.layer.cornerRadius = 5
        
        getRandomBackground()
        
        getUserDetail(userId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(#function)
        configNavBar(isHidden: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
        configNavBar(isHidden: false)
    }
  
    func getUserDetail(_ userId: Int) {
        print(#function)
        UtilVC.instance.showActivityIndicator()
        UserDataService.getUserDetail(userId: userId) { response in

            UtilVC.instance.hideActivityIndicator()
            guard let user = response else {
                UtilVC.instance.showMessage(viewController: self, message: "Failure 🙁")
                return
            }
            self.showUserInfo(user)
            
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showUserInfo(_ user: User) {
        
        fullNameLbl.text = "\(user.firstName) \(user.lastName)"
        emailLbl.text = user.email
        avatar.markCircleAround()
        avatar.image = UIImage(named: "profileDefault")
        AF.request(user.avatar).responseImage { response in
            if case .success(let image) = response.result {
                self.avatar.image  = image
               }
        }
    }
    
    func getRandomBackground() {
        AF.request(RANDOM_IMAGE_BACKGROUND).responseImage { response in
            if case .success(let image) = response.result {
                self.backgroundImage.image  = image
               }
        }
    }
    
    func configNavBar(isHidden: Bool) {
        self.navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }

}
