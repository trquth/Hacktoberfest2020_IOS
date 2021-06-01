//
//  ScrollViewManualCodeVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 30/03/2021.
//

import UIKit

class ScrollViewManualCodeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sv = UIScrollView(frame: self.view.bounds)
        //sv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        sv.contentInsetAdjustmentBehavior = .always
        //sv.indicatorStyle = .default
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sv.topAnchor.constraint(equalTo: self.view.topAnchor),
            sv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        //var y : CGFloat = 10
        let svclg = sv.contentLayoutGuide
        var previousLbl : UILabel? = nil
        for i in 0 ..< 30 {
            let lbl = UILabel()
            lbl.text = "This is label #\(i)"
            //lbl.sizeToFit()
            //lbl.frame.origin = CGPoint(x: 10, y: y)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            sv.addSubview(lbl)
            
            lbl.leadingAnchor.constraint(equalTo: svclg.leadingAnchor, constant: 10).isActive = true
            lbl.topAnchor.constraint(equalTo: previousLbl?.bottomAnchor ?? svclg.topAnchor, constant: 10).isActive = true
            previousLbl = lbl
            //y += lbl.bounds.size.height + 10
        }
//        var sz = sv.bounds.size
//        print("size  \(sz)")
//        print("y \(y)")
//        sz.height = y
//        sv.contentSize = sz
        
        svclg.bottomAnchor.constraint(equalTo: previousLbl!.bottomAnchor).isActive = true
        //svclg.widthAnchor.constraint(equalToConstant: 0).isActive = true
//        let svlfg = sv.frameLayoutGuide
//        svclg.widthAnchor.constraint(equalTo: svlfg.widthAnchor).isActive = true
        previousLbl?.trailingAnchor.constraint(equalTo: sv.trailingAnchor).isActive = true
        
        delay(2){
            print(#function)
            print(sv.contentSize)
            print(sv.adjustedContentInset)
            //print(sv.contentLayoutGuide)
            print(sv.contentOffset)
            print(sv.contentInsetAdjustmentBehavior)
        }
    }
    
//    override func viewDidLayoutSubviews() {
//        delay(2, closure: {
//            print(#function)
//            print(self.view.subviews)
//            if let sv = self.view.subviews[0] as? UIScrollView {
//                print(sv.contentSize)
//                //print(sv.contentLayoutGuide)
//                print(sv.contentOffset)
//            }
//        })
//    }

}
