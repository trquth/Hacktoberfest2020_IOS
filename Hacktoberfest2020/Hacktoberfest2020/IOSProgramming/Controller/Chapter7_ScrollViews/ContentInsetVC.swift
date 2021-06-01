//
//  ContentInsetVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 23/01/2021.
//

import UIKit

class ContentInsetVC: UIViewController {
    var sv : UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Content Inset"

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let sv = UIScrollView()
        self.sv = sv
        //sv.contentInsetAdjustmentBehavior = .scrollableAxes
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sv.topAnchor.constraint(equalTo: self.view.topAnchor),
            sv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sv.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        var previousLabel : UILabel? = nil
        let svclg = sv.contentLayoutGuide
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.backgroundColor = .red
            lab.text = "This is label \(i + 1)"
            lab.translatesAutoresizingMaskIntoConstraints = false
            sv.addSubview(lab)
            
            lab.topAnchor.constraint(equalTo: previousLabel?.bottomAnchor ?? svclg.topAnchor, constant: 10).isActive = true
            lab.leadingAnchor.constraint(equalTo: svclg.leadingAnchor
                                         , constant: 10).isActive = true
            previousLabel = lab
        }
        
        svclg.bottomAnchor.constraint(equalTo: previousLabel!.bottomAnchor, constant: 0).isActive = true
        let svflg = sv.frameLayoutGuide
        svclg.widthAnchor.constraint(equalTo: svflg.widthAnchor).isActive = true
        sv.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        if let sv = self.sv {
            print("content inset", sv.contentInset)
            print("adjusted content inset", sv.adjustedContentInset)
            print("vertical scroll indicator insets", sv.verticalScrollIndicatorInsets)
            print("horizontal scroll indicator insets", sv.horizontalScrollIndicatorInsets)
            print("content offset", sv.contentOffset)
            print("nav bar height", self.navigationController?.navigationBar.bounds.height as Any)
        }
    }
}

extension ContentInsetVC : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("did scroll offset", scrollView.contentOffset)
    }
    
    func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        print("did change inset!")
//        print("content inset", scrollView.contentInset)
//        print("adjusted content inset",scrollView.adjustedContentInset)
//        print("vertical scroll indicator insets",scrollView.verticalScrollIndicatorInsets)
//        print("horizontal scroll indicator insets",scrollView.horizontalScrollIndicatorInsets)
//        print("content offset",scrollView.contentOffset)
//        print("behavior", scrollView.contentInsetAdjustmentBehavior.rawValue)
    }
}
 
