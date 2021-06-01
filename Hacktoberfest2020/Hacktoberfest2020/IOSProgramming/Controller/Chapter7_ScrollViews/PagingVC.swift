//
//  PagingVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 23/01/2021.
//

import UIKit

class PagingVC: UIViewController {

    @IBOutlet weak var sv: UIScrollView!
    @IBOutlet weak var paper: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Paging"
        //Paper Configure
        self.paper.currentPageIndicatorTintColor = .systemRed
        self.paper.pageIndicatorTintColor = .systemOrange
        self.paper.backgroundColor = .blue
        self.paper.backgroundStyle = .prominent
        self.paper.preferredIndicatorImage = UIImage(systemName: "heart.fill")
        self.paper.setIndicatorImage(UIImage(named: "trash")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), forPage: 0)
        self.paper.numberOfPages = 30
        
        print(self.paper.size(forNumberOfPages: 20))
        print(self.paper.size(forNumberOfPages: 50))
    }

    var didLayout = false
    override func viewDidLayoutSubviews() {
        if !self.didLayout {
            self.didLayout = true
            let sz = self.sv.bounds
            let colors : [UIColor] = [.red, .blue,.yellow]
            for i in 0 ..< 3 {
                let v = UIView(frame: CGRect(x: sz.width*CGFloat(i), y: 0, width: sz.width, height: sz.height))
                v.backgroundColor = colors[i]
                self.sv.addSubview(v)
            }
            self.sv.contentSize = CGSize(sz.width * 3, sz.height)
            self.sv.layer.borderWidth = 1
        }
    }

}

extension PagingVC : UIScrollViewDelegate {
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("begin")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("end")
        let x = self.sv.contentOffset.x
        let w = self.sv.bounds.size.width
        self.paper.currentPage = Int(x/w)
    }
   
    @IBAction func userDidPage(_ sender: Any?){
        let p = self.paper.currentPage
        print("current page",p)
        let w = self.sv.bounds.width
        print(CGFloat(p)*w)
        self.sv.setContentOffset(CGPoint(CGFloat(p)*w, 0), animated: true)
    }
}
