//
//  CompositionLayoutIOS13VC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 09/01/2021.
//

import UIKit


extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}
extension CGSize {
    init(_ width:CGFloat, _ height:CGFloat) {
        self.init(width:width, height:height)
    }
}
extension CGPoint {
    init(_ x:CGFloat, _ y:CGFloat) {
        self.init(x:x, y:y)
    }
}
extension CGVector {
    init (_ dx:CGFloat, _ dy:CGFloat) {
        self.init(dx:dx, dy:dy)
    }
}
extension CGRect {
    var center : CGPoint {
        return CGPoint(self.midX, self.midY)
    }
}

class Deco : UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CompositionLayoutIOS13VC: UICollectionViewController {
    
    init() {
        let flow = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: flow)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    static let header = "Header"
        
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(30))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.interItemSpacing = .fixed(15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 15, trailing: 10)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .estimated(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: Self.header, alignment: .top)
        header.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(10), trailing: nil, bottom: .fixed(10))
        section.boundarySupplementaryItems = [header]
        
        let deco = NSCollectionLayoutDecorationItem.background(elementKind: "background")
        deco.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        section.decorationItems = [deco]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Composition Layout"
        
        self.collectionView.backgroundColor = .white
        
//        let itemSize = NSCollectionLayoutSize( widthDimension: .absolute(70), heightDimension: .fractionalHeight(1))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        let groupSize = NSCollectionLayoutSize(
//
//        widthDimension: .fractionalWidth(1),
//
//        heightDimension: .absolute(45))
//        let group = NSCollectionLayoutGroup.horizontal(
//
//        layoutSize: groupSize, subitems: [item])
//        group.interItemSpacing = .flexible(10)
//        group.contentInsets = NSDirectionalEdgeInsets(
//
//        top: 0, leading: 20, bottom: 0, trailing: 20)
//        let section = NSCollectionLayoutSection(group: group)
//        let vSpace = CGFloat(10)
//        section.contentInsets = NSDirectionalEdgeInsets(
//
//        top: vSpace, leading: 0, bottom: vSpace, trailing: 0)
//        section.interGroupSpacing = vSpace
        
        
//        let itemSize = NSCollectionLayoutSize(
//                            widthDimension: .fractionalWidth(1),
//                            heightDimension: .fractionalHeight(0.5))
//                        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                        let vgroupSize = NSCollectionLayoutSize(
//                            widthDimension: .fractionalWidth(0.48),
//                            heightDimension: .absolute(60))
//                        let vgroup = NSCollectionLayoutGroup.vertical(
//                            layoutSize: vgroupSize, subitems: [item])
//                        let hgroupSize = NSCollectionLayoutSize(
//                            widthDimension: .fractionalWidth(1),
//                            heightDimension: .absolute(60))
//                        let hgroup = NSCollectionLayoutGroup.horizontal(
//                            layoutSize: hgroupSize, subitems: [vgroup])
//                        hgroup.interItemSpacing = .flexible(1)
//                        let section = NSCollectionLayoutSection(group: hgroup)
//                        section.interGroupSpacing = 20
//        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
//        let itemSize = NSCollectionLayoutSize(
//                            widthDimension: .fractionalWidth(1),
//                            heightDimension: .fractionalHeight(1))
//                        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                        let groupSize = NSCollectionLayoutSize(
//                            widthDimension: .fractionalWidth(0.8),
//                            heightDimension: .absolute(60))
//                        let group = NSCollectionLayoutGroup.horizontal(
//                            layoutSize: groupSize, subitems: [item])
//                        let section = NSCollectionLayoutSection(group: group)
//                        section.interGroupSpacing = 20
//                        section.orthogonalScrollingBehavior = .groupPaging
//
        
        
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        
//        self.collectionView.collectionViewLayout = layout
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView.register(UICollectionReusableView.self,
                                     forSupplementaryViewOfKind:Self.header,
                                     withReuseIdentifier: self.headerId)
        self.collectionView.register(UICollectionReusableView.self,
                                     forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader,
                                     withReuseIdentifier: self.headerId)
        
        let layout = self.createLayout()
        layout.register(Deco.self, forDecorationViewOfKind: "background")
        self.collectionView.collectionViewLayout = layout

    }
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath)
        if cell.subviews.count == 0 {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            cell.contentView.addSubview(lbl)
            
            NSLayoutConstraint.activate([
                lbl.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                lbl.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            ])
            
            cell.contentView.layer.borderWidth = 2
        }
        
        let lab = cell.contentView.subviews[0] as! UILabel
        lab.text = String(indexPath.item + 1)
        return cell
    }
}
