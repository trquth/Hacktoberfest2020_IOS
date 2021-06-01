//
//  NewFeaturesCollectionVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 14/04/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class NewFeaturesCollectionVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }


}


class FirstWayCollectionVC : UICollectionViewController {
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath)
        var config = UIListContentConfiguration.cell()
        config.text = "\(indexPath.row)"
        cell.contentConfiguration = config
        return cell
    }
}

class SecondWayCollectionVC: UICollectionViewController {
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    let cellReg = UICollectionView.CellRegistration<UICollectionViewCell, Any>(){
        cell, indexPath, name in
        var config = UIListContentConfiguration.cell()
        config.text = "\(name)"
        cell.contentConfiguration = config
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellReg, for: indexPath , item: indexPath.row * 2)
        return cell
    }
}

class ThirdWayCollectionVC : UICollectionViewController {
    var dataSource : UICollectionViewDiffableDataSource<String, String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cellReg = UICollectionView.CellRegistration<UICollectionViewCell, String> { (cell, indexPath, data) in
            var config = UIListContentConfiguration.cell()
            config.text = data
            cell.contentConfiguration = config
        }
        
        self.dataSource = UICollectionViewDiffableDataSource<String, String>(collectionView: self.collectionView){
            collectionView, indexPath, data in
            collectionView.dequeueConfiguredReusableCell(using: cellReg, for: indexPath, item: data)
        }
        
        var snap = NSDiffableDataSourceSnapshot<String, String>()
        snap.appendSections(["Number"])
        snap.appendItems(["0","3","6"])
        self.dataSource.apply(snap, animatingDifferences: true)
    }
}
