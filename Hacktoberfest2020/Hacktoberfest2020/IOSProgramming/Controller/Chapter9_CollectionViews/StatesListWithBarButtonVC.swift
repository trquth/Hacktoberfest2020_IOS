//
//  StatesListWithBarButtonVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 27/12/2020.
//

import UIKit

private let reuseIdentifier = "Cell"

class StatesListWithBarButtonVC: UICollectionViewController {
    
    
    var sections : [Section]!
    let cellId = "cellId"
    let headerId = "headerId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "States"
        
        let switchBtn = UIBarButtonItem(title: "Switch", style: .plain, target: self, action: #selector(doSwitch))
        self.navigationItem.leftBarButtonItem = switchBtn
        let deleteBtn = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(doDelete))
        self.navigationItem.rightBarButtonItem = deleteBtn
        
        self.sections = Util.initData()
        
        self.collectionView.backgroundColor = .white
        //self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
        self.collectionView.register(UINib(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: self.cellId)
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerId)
        
        let flow = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.headerReferenceSize = CGSize(width: 50, height: 50)
        flow.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        flow.itemSize = CGSize(width: 100, height: 50)
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].rowData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let v = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
//        if v.subviews.count == 0 {
//            let lbl = UILabel()
//            lbl.translatesAutoresizingMaskIntoConstraints = false
//            lbl.backgroundColor = .lightGray
//            lbl.layer.cornerRadius = 8
//            lbl.layer.borderWidth = 1
//            lbl.layer.borderColor = UIColor.black.cgColor
//            lbl.layer.masksToBounds = true
//
//            v.addSubview(lbl)
//            NSLayoutConstraint.activate([
//                NSLayoutConstraint.constraints(withVisualFormat: "H:|-2-[lab]-2-|", options: [], metrics: nil, views: ["lab":lbl]),
//                NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[lab]-2-|", options: [], metrics: nil, views: ["lab":lbl])
//            ].flatMap{$0})
//        }
//        let lab = v.subviews[0] as! UILabel
//        print("data \(self.sections[indexPath.section].rowData[indexPath.row])")
//        lab.text = self.sections[indexPath.section].rowData[indexPath.row]
//        //lab.sizeToFit()
//        return v
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! Cell
        if cell.lab.text == "Label" {
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.backgroundColor = .lightGray
            
            let r = UIGraphicsImageRenderer(size:cell.bounds.size)
            let im = r.image {
                ctx in let con = ctx.cgContext
                let shadow = NSShadow()
                shadow.shadowColor = UIColor.darkGray
                shadow.shadowOffset = CGSize(width: 2,height: 2)
                shadow.shadowBlurRadius = 4
                let check2 =
                    NSAttributedString(string:"\u{2714}", attributes:[
                        .font: UIFont(name:"ZapfDingbatsITC", size:24)!,
                        .foregroundColor: UIColor.green,
                        .strokeColor: UIColor.red,
                        .strokeWidth: -4,
                        .shadow: shadow
                        ])
                con.scaleBy(x:1.1, y:1)
                check2.draw(at:CGPoint(x: 2,y: 0))
            }

            let iv = UIImageView(image:nil, highlightedImage:im)
            iv.isUserInteractionEnabled = false
            cell.addSubview(iv)
        }
        
        cell.lab.text = self.sections[indexPath.section].rowData[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var v : UICollectionReusableView! = nil
        if kind == UICollectionView.elementKindSectionHeader {
            v = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:headerId, for: indexPath)
            if v.subviews.count == 0 {
                let lab = UILabel()
                lab.translatesAutoresizingMaskIntoConstraints = false
                lab.textAlignment = .center
                lab.backgroundColor = .lightGray
                lab.layer.cornerRadius = 8
                lab.layer.borderWidth = 2
                lab.layer.masksToBounds = true // has to be added for iOS 8 label
                lab.layer.borderColor = UIColor.black.cgColor
                lab.textAlignment = .center
                
                v.addSubview(lab)
                NSLayoutConstraint.activate([
                    NSLayoutConstraint.constraints(withVisualFormat:"H:|-10-[lab(35)]",
                        metrics:nil, views:["lab":lab]),
                    NSLayoutConstraint.constraints(withVisualFormat:"V:[lab(30)]-5-|",
                    metrics:nil, views:["lab":lab])
                ].flatMap {$0})
            }
            
            let lab = v.subviews[0] as! UILabel
            lab.text = self.sections[indexPath.section].sectionName
        }
        return v
    }
    
}

extension StatesListWithBarButtonVC : UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let memosize = self.sections[indexPath.section].rowData[indexPath.row].size
//        print(memosize)
//        return .zero
//        if  {
//            return memosize
//        }
//
//
//    }
    
    @objc func doSwitch(_ sender: Any){
        print("run doSwitch")
        
        let oldLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        var newLayout = self.collectionViewLayout as! UICollectionViewFlowLayout
        
        if newLayout == oldLayout {
            
        }
    }
    
    @objc func doDelete(_ sender: Any){
        print("run doDelete")
    }
}
