//
//  StatesListVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/12/2020.
//

import UIKit

private let reuseIdentifier = "Cell"

class StatesListVC: UICollectionViewController {
    let cellId = "cellId"
    let header2Id = "header2Id"
    
    var sections : [Section]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sections = Util.initData()
        //print("Data---->",self.sections)

        self.navigationItem.title = "States"
        self.collectionView.backgroundColor = .white
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.header2Id)
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: 30, height: 30)
        //layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
      
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].rowData.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var v : UICollectionReusableView! = nil
        print(self.sections[indexPath.section].sectionName)
        if kind == UICollectionView.elementKindSectionHeader {
            v = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.header2Id, for: indexPath)
            if v.subviews.count == 0 {
                let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 030, height: 30))
                lbl.translatesAutoresizingMaskIntoConstraints = false
                v.addSubview(lbl)
                NSLayoutConstraint.activate([
                    lbl.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 0),
                    lbl.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: 0),
                    lbl.topAnchor.constraint(equalTo: v.topAnchor, constant: 0),
                    lbl.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 0),
                ])
            }
            let lab = v.subviews[0] as! UILabel
            lab.text = self.sections[indexPath.section].sectionName
            //lab.textAlignment = .center
        }
        return v
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath)
        if cell.contentView.subviews.count == 0 {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
           
            //lbl.numberOfLines = 2
            cell.contentView.addSubview(lbl)
            NSLayoutConstraint.activate([
                lbl.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 0),
                lbl.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 0),
                lbl.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 0),
                lbl.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 0),
            ])
        }
        let lab = cell.contentView.subviews[0] as! UILabel
            lab.text =  self.sections[indexPath.section].rowData[indexPath.row]
        lab.sizeToFit()
        return cell
    }
}

extension StatesListVC: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let lab = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        lab.text =  self.sections[indexPath.section].rowData[indexPath.row]
//        lab.sizeToFit()
//        return lab.bounds.size
//    }
}

extension StatesListVC {
    override func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return self.sections.map{$0.sectionName}
    }

    override func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        let sectionNames = self.sections.map{$0.sectionName}
        let ix = sectionNames.firstIndex(of: title)!
        return IndexPath(item: 0, section: ix)
    }
}

