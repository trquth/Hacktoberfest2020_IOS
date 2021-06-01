//
//  GestureConflicVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 29/12/2020.
//

import UIKit

class GestureConflictVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "GestureConflict Example"
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .lightGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[cv]|", options: [], metrics: nil, views: ["cv" : collectionView]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[cv]|", options: [], metrics: nil, views: ["cv" : collectionView])
        ].flatMap{$0})
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        let t = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.view.addGestureRecognizer(t)
        t.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select item")
    }
    
    @objc func tap(_: UIGestureRecognizer){
        print("tap")
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let v = gestureRecognizer.view {
            let loc = gestureRecognizer.location(in: v)
            if let v2  = v.hitTest(loc, with: nil) {
                return !v2.isDescendant(of: UICollectionViewCell.self)
            }
        }
        return true
    }
   

}
extension UIView {
    func isDescendant(of whattype:UIView.Type) -> Bool {
        var sup : UIView? = self.superview
        while sup != nil {
            if (whattype == type(of:sup!)) { // argh, can't say "is" here
                return true
            }
            sup = sup!.superview
        }
        return false
    }
}
