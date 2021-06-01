//
//  PokemonCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 30/01/2021.
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.layer.cornerRadius = self.contentView.frame.height / 5
        self.contentView.layer.backgroundColor = UIColor.lightGray.cgColor
        self.contentView.layer.shadowColor = UIColor.lightGray.cgColor
        self.contentView.layer.shadowOpacity = 0.75
        self.contentView.layer.shadowOffset = .zero
        self.contentView.layer.shadowRadius = 5
        
        pokemonImage.layer.shadowColor = UIColor.black.cgColor
        pokemonImage.layer.shadowOpacity = 0.75
        pokemonImage.layer.shadowOffset = .zero
        pokemonImage.layer.shadowRadius = 5
        pokemonImage.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
