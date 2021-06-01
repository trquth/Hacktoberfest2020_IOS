//
//  FlowLayoutCV.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 06/01/2021.
//

import UIKit

class FlowLayoutVC: UICollectionViewController {
    
    
    private let cellId = "CellId"
    private let headerId = "HeaderId"
    private let iDevices = ["Macbook", "iPhone", "Magic Keyboard", "Magic Trackpad", "iPad"]

    override func viewDidLoad() {
        self.navigationItem.title = "Flow Layout"
        self.collectionView.backgroundColor = .white
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.headerReferenceSize = CGSize(width: 200, height: 30)
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iDevices.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var v : UICollectionReusableView!
        if kind == UICollectionView.elementKindSectionHeader {
            v = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerId, for: indexPath)
            if v.subviews.count == 0 {
                v.addSubview(UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30)))
            }
            let lab = v.subviews[0] as! UILabel
            lab.text = "iDevices"
            lab.textAlignment = .center
        }
        return v
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath)
        if cell.contentView.subviews.count == 0 {
            let lab = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            cell.contentView.addSubview(lab)
            
//            lab.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
//            lab.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
//            lab.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
//            lab.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
        }
        let lab = cell.contentView.subviews[0] as! UILabel
        lab.text = self.iDevices[indexPath.row]
        lab.sizeToFit()
        cell.contentView.backgroundColor = .yellow
        return cell
    }

}

extension FlowLayoutVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lab = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        lab.text = self.iDevices[indexPath.row]
        lab.sizeToFit()
        return lab.bounds.size
    }
}

extension FlowLayoutVC {
    override func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return ["a","b","c","d","e","f"].map{$0}
    }
}
