//
//  PokeApi.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 30/01/2021.
//

import Foundation
import UIKit

enum PokemonImageError: Error {
    case imageCreationError
    case missingImageURL
}

struct PokemonResponse : Codable {
    let results : [Pokemon]
}

class PokeApi {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchPokemonNames(completion: @escaping (Result<[Pokemon],Error>) -> Void) {
        let url = PokeURL.pokeURL(url: EndPoint.pokemons, parameters: [
            "limit": "890",
            "offset": "0"
        ])
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){(data, response, error) in
            let parsedData =  self.handlePokemonsRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(parsedData)
            }
        }
        task.resume()
    }
    
    private func handlePokemonsRequest(data : Data? , error: Error?) -> Result<[Pokemon],Error>{
        guard let jsonData = data else {
            return .failure(error!)
        }
        return parseResponseData(fromJSON: jsonData)
    }
    
    private func parseResponseData(fromJSON data: Data) -> Result<[Pokemon],Error> {
        do {
            let decoder = JSONDecoder()
            let pokemonsResponse = try decoder.decode(PokemonResponse.self, from: data)
            let pokemons = pokemonsResponse.results
            return .success(pokemons)
        } catch let error {
            print(error)
            return .failure(error)
        }
    }
    
    func fetchImage(for pokemon: Pokemon, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: "https://img.pokemondb.net/sprites/x-y/normal/\(pokemon.name).png") else {
            return completion(.failure(PokemonImageError.missingImageURL))
        }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error) in
            let result = self.handleImagePokemonRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func handleImagePokemonRequest(data: Data?, error: Error?) -> Result<UIImage, Error>{
        guard let imageData = data, let image = UIImage(data: imageData) else {
            if data == nil {
                return .failure(error!)
            }else{
                return .failure(PokemonImageError.imageCreationError)
            }
        }
        return .success(image)
    }
}
