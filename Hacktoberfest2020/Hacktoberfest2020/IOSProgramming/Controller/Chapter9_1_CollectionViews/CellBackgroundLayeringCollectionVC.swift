//
//  CellBackgroundLayeringCollectionVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 13/04/2021.
//

import UIKit


class CellBackgroundLayeringCollectionVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(self.collectionView.bounds.width,50)
        
        let v = UIView()
        v.backgroundColor = .yellow
        self.collectionView.backgroundView = v
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 30
    }

    let reuseIdentifier = "Cell"

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if cell.backgroundView == nil {
            //cell.backgroundColor = .red
            
            let bg = UIView(frame: cell.bounds)
            bg.backgroundColor = .green
            cell.backgroundView = bg
            
            let lab = UILabel()
            lab.tag = 1
            lab.text = "1"
            lab.sizeToFit()
            lab.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            cell.contentView.addSubview(lab)
            lab.textColor = .white
        }
        
        let lab = cell.viewWithTag(1) as! UILabel
        lab.text = "#\(indexPath.row)"
        return cell
    }
}
