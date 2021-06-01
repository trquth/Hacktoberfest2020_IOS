//
//  LoadingCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/01/2021.
//

import UIKit

class LoadingCell: UITableViewCell {

    @IBOutlet weak var pokeballImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokeballImage.layer.shadowColor = UIColor.gray.cgColor
        pokeballImage.layer.shadowOpacity = 0.8
        pokeballImage.layer.shadowOffset = .zero
        pokeballImage.layer.shadowRadius = 1
        pokeballImage.layer.masksToBounds = false
        pokeballImage.alpha = 0.8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func rotate(duration: Double = 20) {
        let rotationAnimation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: .pi * 2.0)
        rotationAnimation.duration = 0.5;
        rotationAnimation.isCumulative = true;
        rotationAnimation.repeatCount = .infinity;
        self.pokeballImage?.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
}
