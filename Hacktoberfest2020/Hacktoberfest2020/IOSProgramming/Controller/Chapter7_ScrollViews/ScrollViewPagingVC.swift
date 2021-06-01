//
//  ScrollViewPagingVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 02/04/2021.
//

import UIKit

class ScrollViewPagingVC: UIViewController {

    @IBOutlet weak var sv: UIScrollView!
    @IBOutlet weak var pager: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sv.delegate = self
        
        self.pager.currentPageIndicatorTintColor = .systemRed
        self.pager.pageIndicatorTintColor = .systemOrange
        
        
         self.pager.backgroundColor = .blue
        self.pager.backgroundStyle = .prominent
        self.pager.pageIndicatorTintColor = .yellow
        self.pager.currentPageIndicatorTintColor = .orange
        self.pager.tintColor = .green // does nothing
        self.pager.allowsContinuousInteraction = false
        self.pager.preferredIndicatorImage = UIImage(systemName: "diamond.fill")!
        self.pager.setIndicatorImage(UIImage(named: "trash")!.withRenderingMode(.alwaysOriginal), forPage: 0)
        self.pager.numberOfPages = 20
        print(self.pager.size(forNumberOfPages: 20))
        print(self.pager.size(forNumberOfPages: 30))
    }

    var didLayout = false
    override func viewDidLayoutSubviews() {
        if !self.didLayout {
            self.didLayout = true
            let sz = self.sv.bounds.size
            let colors : [UIColor] = [.red, .green, .yellow]
            for i in 0 ..< 3 {
                let v = UIView(frame:CGRect(sz.width*CGFloat(i),0,sz.width,sz.height))
                v.backgroundColor = colors[i]
                self.sv.addSubview(v)
            }
            self.sv.contentSize = CGSize(3*sz.width,sz.height)
            self.sv.layer.borderWidth = 1 // just so we can see what's really going on
        }
    }
}

extension ScrollViewPagingVC : UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(#function)
//    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("begin")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("end")
        let x = self.sv.contentOffset.x
        let w = self.sv.bounds.size.width
        self.pager.currentPage = Int(x/w)
    }
    
}
