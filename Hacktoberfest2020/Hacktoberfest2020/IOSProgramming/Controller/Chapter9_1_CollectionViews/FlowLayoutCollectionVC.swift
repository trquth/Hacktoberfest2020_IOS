//
//  FlowLayoutCollectionVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 14/04/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class FlowLayoutCollectionVC: UICollectionViewController {

    struct Section {
        var sectionName : String
        var rowData : [String]
    }
    var sections : [Section]!

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    let headerID = "Header"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let s = try! String(
            contentsOfFile: Bundle.main.path(
                forResource: "states", ofType: "txt")!)
        let states = s.components(separatedBy:"\n")
        let d = Dictionary(grouping: states) {String($0.prefix(1))}
        self.sections = Array(d).sorted {$0.key < $1.key}.map {
            Section(sectionName: $0.key, rowData: $0.value)
        }
        
        self.navigationItem.title = "States"
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerID)
        let flow = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.headerReferenceSize = CGSize(30, 30)
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].rowData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var v : UICollectionReusableView! = nil
        if kind == UICollectionView.elementKindSectionHeader {
            v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.headerID, for: indexPath)
            if v.subviews.count == 0 {
                v.addSubview(UILabel(frame:CGRect(0, 0, 30, 30)))
            }
            let lab = v.subviews[0] as! UILabel
            lab.text = self.sections[indexPath.section].sectionName
            lab.textColor = .blue
            lab.textAlignment = .center
        }
        return v
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if cell.contentView.subviews.count == 0 {
            let lab = UILabel(frame: CGRect(0, 0, 30, 30))
            lab.textColor = .white
            cell.contentView.addSubview(lab)
        }
        let lab = cell.contentView.subviews[0] as! UILabel
        lab.text = self.sections[indexPath.section].rowData[indexPath.row]
        lab.sizeToFit()
        cell.contentView.backgroundColor = .red
        
        return cell
    }

}

extension FlowLayoutCollectionVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lab = UILabel(frame: CGRect(0, 0, 30, 30))
        lab.text = self.sections[indexPath.section].rowData[indexPath.row]
        lab.sizeToFit()
        return lab.bounds.size
    }
    
    override func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return self.sections.map{
            $0.sectionName
        }
    }
    
//    override func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
//        let sectionName = self.sections.map{
//            $0.sectionName
//        }
//        let ix = sectionName.firstIndex(of: title)!
//        return IndexPath(item: 0, section: ix)
//    }
}
