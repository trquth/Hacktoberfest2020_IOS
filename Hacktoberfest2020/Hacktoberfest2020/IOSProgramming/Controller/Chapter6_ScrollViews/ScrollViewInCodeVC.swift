//
//  ScrollViewInCodeVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/01/2021.
//

import UIKit

func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

class ScrollViewInCodeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "ScrollView In Code"
            
        let sv = UIScrollView(frame: self.view.bounds)
        //sv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sv.topAnchor.constraint(equalTo: self.view.topAnchor),
            sv.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            sv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        sv.backgroundColor = .white
        let svclg = sv.contentLayoutGuide
        var previousLabel : UILabel? = nil
        //var y : CGFloat = 10
        
        for i in 0 ..< 100 {
            let label = UILabel()
            label.text = "This is label \(i)"
           // label.sizeToFit()
            //label.frame.origin = CGPoint(10, y)
            label.translatesAutoresizingMaskIntoConstraints = false
            sv.addSubview(label)
            //y += label.bounds.size.height
            label.leadingAnchor.constraint(equalTo: svclg.leadingAnchor, constant: 10).isActive = true
            label.topAnchor.constraint(equalTo: previousLabel?.bottomAnchor ?? svclg.topAnchor, constant: 10).isActive = true
            previousLabel = label
            
//            label.frame.size.width = self.view.bounds.width - 20
//            label.backgroundColor = .red
//            label.autoresizingMask = .flexibleWidth
        }
        svclg.bottomAnchor.constraint(
                    equalTo: previousLabel!.bottomAnchor, constant: 10).isActive = true
        previousLabel?.trailingAnchor.constraint(equalTo: sv.trailingAnchor).isActive = true
        //var sz = sv.bounds.size
       // sz.height = y
        
        if #available(iOS 11.0, *) {
            //sv.contentLayoutGuide.widthAnchor.constraint(equalToConstant: sz.width).isActive = true
            //sv.contentLayoutGuide.heightAnchor.constraint(equalToConstant: sz.height).isActive = true
            //sv.contentSize = sz
            //print(sv.contentInsetAdjustmentBehavior.rawValue) // .automatic
            //svclg.widthAnchor.constraint(equalToConstant:0).isActive = true
            
//            let svflg = sv.frameLayoutGuide
//            svclg.widthAnchor.constraint(equalTo:svflg.widthAnchor).isActive = true
//
            sv.contentInsetAdjustmentBehavior = .never
            //x4sv.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 10)
            delay(2) {
                print("This log")
                print(sv.contentSize)
                print("----------------------------")
                print(sv.contentLayoutGuide)
                print("----------------------------")
                print(sv.adjustedContentInset)
                print("----------------------------")
                print(sv.contentOffset)
                print("----------------------------")
                print(sv.contentInsetAdjustmentBehavior.rawValue)
            }
        }else{
            //sv.contentSize = sz
        }
    }
    
    override func viewDidLayoutSubviews() {
//        delay(2) {
//            print("Log viewDidLayoutSubviews")
//            if let sv = self.view.subviews[0] as? UIScrollView {
//                print(sv.contentSize)
//                print("----------------------------")
//                print(sv.contentLayoutGuide)
//                print("----------------------------")
//                print(sv.contentOffset)
//            }
//        }
    }

}
