//
//  PhotoCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/06/2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    func configureView(photo: UIImage) {
        self.addSubview(UIImageView(image: photo))
    }
    
}
