//
//  CellBackgroundVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 06/01/2021.
//

import UIKit


class CellBackgroundVC: UICollectionViewController {
    
    private let cellId = "CellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Cell Background"
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: self.collectionView.bounds.width / 2, height: 50)
        
        self.collectionView.backgroundColor = .white
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        if cell.backgroundView == nil {
            cell.backgroundColor = .lightGray
            
            let v = UIImageView(frame: cell.bounds)
            v.contentMode = .scaleToFill
            v.image = UIImage(named: "linen.png")
            cell.backgroundView = v
            
            let v2 = UIView(frame: cell.bounds)
            v2.backgroundColor = .yellow
            cell.selectedBackgroundView = v2
            
            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.tag = 1
            lab.textColor = .black
            lab.highlightedTextColor = .red
            lab.backgroundColor = .clear
            cell.contentView.addSubview(lab)
//            NSLayoutConstraint.activate([
//                NSLayoutConstraint.constraints(withVisualFormat: "H:|-[lab]-|", options: [], metrics:nil, views: ["lab":lab]),
//                NSLayoutConstraint.constraints(withVisualFormat: "V:|-[lab]-|", options: [], metrics: nil, views: ["lab":lab])
//            ].flatMap{$0})
            NSLayoutConstraint.activate([
                lab.centerXAnchor.constraint(equalTo:cell.contentView.centerXAnchor),
                lab.centerYAnchor.constraint(equalTo:cell.contentView.centerYAnchor)
            ])
        }
        let lab = cell.viewWithTag(1) as! UILabel
        lab.text = "No. \(indexPath.item)"
        return cell
    }
    
    
    
}
