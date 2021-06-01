//
//  PokemonModel.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 30/01/2021.
//

import Foundation
import UIKit

struct PokemonModel {
    var pokemonName : String = ""
    var pokemonImage : UIImage? = nil
    var pokemonID: Int = 0
}

extension PokemonModel : Equatable {
    static func == (lhs: PokemonModel, rhs: PokemonModel) -> Bool{
        return lhs.pokemonID == rhs.pokemonID
    }
}
