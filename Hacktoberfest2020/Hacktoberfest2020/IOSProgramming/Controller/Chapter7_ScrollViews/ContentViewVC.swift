//
//  ContentViewVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/03/2021.
//

import UIKit

class ContentViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sv.topAnchor.constraint(equalTo: self.view.topAnchor),
            sv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let cv = UIView() //Content View
       
        //sv.addSubview(cv)
        //The first way
        //        var y : CGFloat = 10
        //        var maxw: CGFloat = 0
        //        for i in 0 ..< 30 {
        //            let lbl = UILabel()
        //            lbl.text = "This is #\(i + 1)"
        //            lbl.sizeToFit()
        //            lbl.textColor = .white
        //            lbl.frame.origin = CGPoint(10, y)
        //            y += lbl.bounds.size.height + 10
        //            cv.addSubview(lbl)
        //            maxw = max(maxw, lbl.frame.maxX + 10)
        //        }
        //        cv.frame = CGRect(0, 0, maxw, y)
        //        sv.contentSize = cv.frame.size
        
        //The second way
        //        var y : CGFloat = 10
        //        var maxw : CGFloat = 0
        //        for i in 0 ..< 30 {
        //            let lbl = UILabel()
        //            lbl.text = "This is #\(i + 1)"
        //            lbl.sizeToFit()
        //            lbl.textColor = .white
        //            lbl.frame.origin = CGPoint(0, y)
        //            y += lbl.bounds.size.height + 10
        //            maxw = max(maxw, lbl.frame.maxX + 10)
        //            cv.addSubview(lbl)
        //        }
        //
        //        cv.translatesAutoresizingMaskIntoConstraints = false
        //        sv.addSubview(cv)
        //        let svclg = sv.contentLayoutGuide
        //        NSLayoutConstraint.activate([
        //            cv.widthAnchor.constraint(equalToConstant: maxw),
        //            cv.heightAnchor.constraint(equalToConstant: y),
        //            cv.leadingAnchor.constraint(equalTo: svclg.leadingAnchor),
        //            cv.topAnchor.constraint(equalTo: svclg.topAnchor),
        //            cv.trailingAnchor.constraint(equalTo: svclg.trailingAnchor),
        //            cv.bottomAnchor.constraint(equalTo: svclg.bottomAnchor)
        //        ])
        
        
        //        var previousLbl : UILabel? = nil
        //        for i in 0..<30 {
        //            let lbl = UILabel()
        //            lbl.text = "This is #\(i + 1)"
        //            lbl.textColor = .white
        //
        //            lbl.translatesAutoresizingMaskIntoConstraints = false
        //            cv.addSubview(lbl)
        //            NSLayoutConstraint.activate([
        //                lbl.leadingAnchor.constraint(equalTo: cv.leadingAnchor, constant: 10),
        //                lbl.topAnchor.constraint(equalTo: previousLbl?.bottomAnchor ?? cv.topAnchor, constant: 10)
        //            ])
        //            previousLbl = lbl
        //        }
        //
        //        previousLbl?.bottomAnchor.constraint(equalTo: cv.bottomAnchor).isActive = true
        //        previousLbl?.trailingAnchor.constraint(equalTo: cv.trailingAnchor).isActive = true // need to do something about width
        //
        //        cv.translatesAutoresizingMaskIntoConstraints = false
        //        sv.addSubview(cv)
        //        let svclg = sv.contentLayoutGuide
        //        NSLayoutConstraint.activate([
        //            svclg.leadingAnchor.constraint(equalTo: cv.leadingAnchor),
        //            svclg.topAnchor.constraint(equalTo: cv.topAnchor),
        //            svclg.trailingAnchor.constraint(equalTo: cv.trailingAnchor),
        //            svclg.bottomAnchor.constraint(equalTo: cv.bottomAnchor)
        //        ])
        //        sv.contentInsetAdjustmentBehavior = .always

        //The fourth way
        sv.addSubview(cv)
        var previousLbl : UILabel? = nil
        for i in 0..<30 {
            let lbl = UILabel()
            lbl.text = "This is #\(i + 1)"
            lbl.textColor = .white
            
            lbl.translatesAutoresizingMaskIntoConstraints = false
            cv.addSubview(lbl)
            
            lbl.leadingAnchor.constraint(equalTo: cv.leadingAnchor, constant: 10).isActive = true
            lbl.topAnchor.constraint(equalTo: previousLbl?.bottomAnchor ?? cv.topAnchor, constant: 10).isActive = true
            
            previousLbl = lbl
        }
        
        previousLbl?.bottomAnchor.constraint(equalTo: cv.bottomAnchor, constant: 10).isActive = true
        previousLbl?.trailingAnchor.constraint(equalTo: cv.trailingAnchor, constant: 10).isActive = true
        
        let minsz = cv.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        print("minsz \(minsz)")
        cv.frame = CGRect(origin: .zero, size: minsz)
        sv.contentSize = minsz
        
        delay(2){
            print(ContentViewVC.self)
            print(#function)
            
            print(sv.contentSize)
            print(sv.contentOffset)
            print(sv.contentInset)
            print(sv.adjustedContentInset)
        }
    }

}
