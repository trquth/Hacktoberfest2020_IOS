//
//  AboutViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/24/20.
//

import UIKit

class AboutViewVC: UIViewController {
    
    let smallView : UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 100, width: 50, height: 50))
        //view.backgroundColor = UIColor(named: "SmallBackground")
        
        view.backgroundColor = UIColor { tc in
            switch tc.userInterfaceStyle {
            case .dark :  return UIColor.white
            default : return UIColor.orange
            }
        }
        
        return view
    }()
    
    let largeView : UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 170, width: 100, height: 100))
        //view.backgroundColor = UIColor(named: "LargeBackground")
        
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "LargeBackground")?.cgColor
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        showLog()
        
        configureView()
        
        viewInsetAnotherView()
    }
    
    func configureView() {
        self.view.addSubview(smallView)
        self.view.addSubview(largeView)
    }
    
    
    func viewInsetAnotherView() {
        let mainView = UIView(frame: CGRect(x: 10, y: 300, width: 120 , height: 200))
        mainView.backgroundColor = .lightGray
        view.addSubview(mainView)
        
        //let squareView = UIView(frame: mainView.bounds.insetBy(dx: 10, dy: 10))
        let squareView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        squareView.backgroundColor = .blue
        mainView.addSubview(squareView)
        
//        squareView.bounds.size.height += 20
//        squareView.bounds.size.width += 20
        //squareView.center = mainView.convert(mainView.center, from: mainView.superview)
    }
    
    func showLog(){
        
        let orange = UIColor.systemOrange
        
        print("showLog", orange)
        let light = UITraitCollection(userInterfaceStyle: .light)
        let dark = UITraitCollection(userInterfaceStyle: .dark)
        
        let orangeLight = orange.resolvedColor(with: light)
        let orangeDark = orange.resolvedColor(with: dark)
        
        print("orangeLight", orangeLight)
        print("orangeDark", orangeDark)
    }

}
