//
//  FlowLayout2VC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 08/01/2021.
//

import UIKit

class MyFlowLayout : UICollectionViewFlowLayout{
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let arr = super.layoutAttributesForElements(in: rect)!
        return arr.map {
            atts in
            var atts = atts
            if atts.representedElementCategory == .cell {
                let ip = atts.indexPath
                atts = self.layoutAttributesForItem(at: ip)!
            }
            return atts
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        var atts = super.layoutAttributesForItem(at:indexPath)!
        if indexPath.item == 0 {
            return atts // degenerate case 1
        }
        if atts.frame.origin.x - 1 <= self.sectionInset.left {
            return atts // degenerate case 2
        }
        let ipPv = IndexPath(item:indexPath.row-1, section:indexPath.section)
        let fPv = self.layoutAttributesForItem(at:ipPv)!.frame
        let rightPv = fPv.origin.x + fPv.size.width + self.minimumInteritemSpacing
        atts = atts.copy() as! UICollectionViewLayoutAttributes
        atts.frame.origin.x = rightPv
        return atts
    }
}

class FlowLayout2VC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    let books = ["iOS 14 Programming Fundamentals with Swift: Swift, Xcode, and Cocoa Basics",
                 "Programming iOS 14","Programming iOS 14: Dive Deep into Views, View Controllers, and Frameworks","iOS 14 Programming for Beginners Fifth Edition","The Easy iOS 14 & iPadOS 14 User Guide For Everyone: With Tips And Tricks To Master And Hidden Features To Unlock",]
    let categories = ["Type A","Type B","Type C"]

    lazy var modelCell : Cell = {
        () -> Cell in
        let arr = UINib(nibName: "Cell", bundle: nil).instantiate(withOwner: nil, options: nil)
        return arr[0] as! Cell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "IOS and Swift Programming"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Switch", style: .plain, target: self, action: #selector(doSwitch))
        
        self.collectionView.backgroundColor = .white
        self.collectionView.register(UINib(nibName: "Cell2", bundle: nil), forCellWithReuseIdentifier: self.cellId)
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerId)
        
        let flow = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        self.setUpFlowLayout(flow)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var v : UICollectionReusableView!
        if kind == UICollectionView.elementKindSectionHeader {
            v = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerId, for: indexPath)
            if v.subviews.count == 0 {
                let lbl = UILabel()
                lbl.translatesAutoresizingMaskIntoConstraints = false
                v.addSubview(lbl)
                NSLayoutConstraint.activate([
                    NSLayoutConstraint.constraints(withVisualFormat:"H:|-10-[lab(100)]",
                                                   metrics:nil, views:["lab":lbl]),
                    NSLayoutConstraint.constraints(withVisualFormat:"V:[lab(30)]-5-|",
                                                   metrics:nil, views:["lab":lbl])
                ].flatMap {$0})
            }
        }
        let lab = v.subviews[0] as! UILabel
        lab.text = self.categories[indexPath.section]
        return v
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! Cell2
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.label.text = self.books[indexPath.row]
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var sz = self.modelCell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        sz.width = ceil(sz.width)
//        sz.height = ceil(sz.height)
//
//        return sz
////        let lbl = UILabel()
////        lbl.text = self.books[indexPath.row]
////        lbl.sizeToFit()
////        return lbl.bounds.size
//    }
    
    func setUpFlowLayout(_ flow:UICollectionViewFlowLayout) {
        flow.headerReferenceSize = CGSize(width: 50,height: 50) // larger - we will place label within this
        flow.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10) // looks nicer
        flow.itemSize = CGSize(width :100,height : 30)
        }
        
    
    @objc func doSwitch(_ sender : Any){
        let oldLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        var newLayout = self.collectionViewLayout as! UICollectionViewFlowLayout
        if newLayout == oldLayout {
            newLayout = MyFlowLayout()
        }
        self.setUpFlowLayout(newLayout)
        self.collectionView.setCollectionViewLayout(newLayout, animated: true)
        
    }
    
}
