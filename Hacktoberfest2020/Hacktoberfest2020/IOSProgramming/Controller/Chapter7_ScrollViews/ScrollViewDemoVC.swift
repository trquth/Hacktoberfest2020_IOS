//
//  ScrollViewByCodeVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 19/01/2021.
//

import UIKit

class ScrollViewDemoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "ScrollView By Code"
        
        createScrollViewTheNewWay()
        
    }
    
    func createScrollViewTheNewWay()  {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            sv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            sv.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            sv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
        sv.backgroundColor = .yellow
        let v = UIView()
        sv.addSubview(v)
        
        //------------------------ OPTION 1 2 --------------------------------------------
        
//        var y : CGFloat = 10
//        var maxw : CGFloat = 0
//        print("screen bounds", UIScreen.main.bounds)
//        for i in 0 ..< 30 {
//            let lab = UILabel()
//            lab.text = "This is label \(i + 1)"
//            lab.sizeToFit()
//            lab.frame.origin = CGPoint(x: 10, y: y)
//            v.addSubview(lab)
//            print("lab \(i + 1) bounds", lab.bounds)
//            print("lab \(i + 1) frame", lab.frame)
//            y += lab.bounds.size.height + 10
//            print("lab \(i + 1) maxw", maxw)
//            maxw = max(maxw, lab.frame.maxX + 10)
//
//        }
        
//        v.frame = CGRect(0, 0, maxw, y)
//        sv.contentSize = v.frame.size
        //        v.translatesAutoresizingMaskIntoConstraints = false
        //        let svclg = sv.contentLayoutGuide
        //        NSLayoutConstraint.activate([
        //            v.widthAnchor.constraint(equalToConstant: maxw),
        //            v.heightAnchor.constraint(equalToConstant: y),
        //            svclg.topAnchor.constraint(equalTo: v.topAnchor),
        //            svclg.bottomAnchor.constraint(equalTo: v.bottomAnchor),
        //            svclg.leadingAnchor.constraint(equalTo: v.leadingAnchor),
        //            svclg.trailingAnchor.constraint(equalTo: v.trailingAnchor),
        //        ])
        //        sv.contentInsetAdjustmentBehavior = .always // work around launch offset bug
        
        //---------------------- OPTION 3 4----------------------------------------------------
        var previousLab : UILabel? = nil
        
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            v.addSubview(lab)
            lab.text = "This is label \(i+1)"
            lab.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 10).isActive = true
            lab.topAnchor.constraint(equalTo: previousLab?.bottomAnchor ?? v.topAnchor, constant: 10).isActive = true
            previousLab = lab
        }
        
        v.bottomAnchor.constraint(equalTo: previousLab!.bottomAnchor, constant: 0).isActive = true
        v.trailingAnchor.constraint(equalTo: previousLab!.trailingAnchor, constant: 0).isActive = true
//        v.translatesAutoresizingMaskIntoConstraints = false
//        let svclg = sv.contentLayoutGuide
//        NSLayoutConstraint.activate([
//            svclg.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 0),
//            svclg.topAnchor.constraint(equalTo: v.topAnchor, constant: 0),
//            svclg.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: 0),
//            svclg.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 0),
//        ])
        //sv.contentInsetAdjustmentBehavior = .always
        let minsz = v.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        print("minsz",minsz)
        v.frame = CGRect(origin: .zero, size: minsz)
        sv.contentSize = minsz
        //------------------------- ------------------------------------------------------------
        
    }
    
    func createScrollViewByAutolayout()  {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            sv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            sv.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            sv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
        
        sv.backgroundColor = .yellow
        let svclg = sv.contentLayoutGuide
        var previousLab : UILabel? = nil
        
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.text = "This is label \(i + 1)"
            lab.translatesAutoresizingMaskIntoConstraints = false
            sv.addSubview(lab)
            lab.leadingAnchor.constraint(equalTo: svclg.leadingAnchor, constant: 10).isActive = true
            lab.topAnchor.constraint(equalTo: previousLab?.bottomAnchor ?? svclg.topAnchor, constant: 10).isActive = true
            lab.backgroundColor = .red
            lab.sizeToFit()
            previousLab = lab
        }
        
        //svclg.bottomAnchor.constraint(equalTo: previousLab!.bottomAnchor, constant: 10).isActive = true
        previousLab?.bottomAnchor.constraint(equalTo: svclg.bottomAnchor, constant: 10).isActive = true
        svclg.widthAnchor.constraint(equalTo: sv.frameLayoutGuide.widthAnchor).isActive = true
        
        delay(2){
            print(sv.contentSize)
            print(sv.contentLayoutGuide)
            print(sv.contentOffset)
        }
    }
    
    func createScrollViewByCode()  {
        let sv = UIScrollView(frame: self.view.bounds)
        //sv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.view.addSubview(sv)
        sv.backgroundColor = .yellow
        var y : CGFloat = 10
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.text = "This is label \(i + 1)"
            lab.frame.origin = CGPoint(x: 10, y: y)
            lab.sizeToFit()
            sv.addSubview(lab)
            y += lab.bounds.size.height + 10
            //lab.frame.size.width = self.view.bounds.width - 100
//            lab.backgroundColor = .red
//            lab.autoresizingMask = .flexibleWidth
        }
        var sz = self.view.bounds.size
        sz.height = y
        print("view bounds size",sz)
        sv.contentSize = sz
        
        print("contentInsetAdjustmentBehavior rawValue",sv.contentInsetAdjustmentBehavior.rawValue)
        sv.contentInsetAdjustmentBehavior = .always
        
        delay(2){
            print("contentSize",sv.contentSize)
            print("contentInset",sv.contentInset)
            print("adjustedContentInset",sv.adjustedContentInset)
            print("horizontalScrollIndicatorInsets", sv.horizontalScrollIndicatorInsets)
            print("verticalScrollIndicatorInsets", sv.verticalScrollIndicatorInsets)
            print("contentOffset",sv.contentOffset)
        }
        
    }

}
