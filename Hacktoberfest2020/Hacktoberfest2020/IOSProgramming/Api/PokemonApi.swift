//
//  PokemonApi.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/01/2021.
//

import UIKit

struct PokemonDataResponse : Codable {
    let results : [Pokemon]
}

class PokemonApi {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchPokemonList(from: Int, to: Int,completion:  @escaping (Result<[Pokemon], Error>) -> Void ){
        var components = URLComponents(string: baseURL+"/pokemon?")!
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "limit", value: "\(to)"))
        queryItems.append(URLQueryItem(name: "offset", value:"\(from)"))
        components.queryItems = queryItems
        
        let request = URLRequest(url: components.url!)
        let task = session.dataTask(with: request){
            (data, response, error) in
            let parsedData = self.parseData(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(parsedData)
            }
        }
        task.resume()
    }
    
    func fetchPokemonThumbnail(pokemonName: String, completion: @escaping (Result<UIImage, Error>) -> Void)  {
        let components = URLComponents(string: "https://img.pokemondb.net/sprites/x-y/normal/\(pokemonName).png")!
        let url = components.url!
        let task = session.dataTask(with: url){
            (data, response, error) in
            let responseData = self.handleResponseImage(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(responseData)
            }
        }
        task.resume()
    }
    
    private func parseData(data: Data?, error: Error?) -> Result<[Pokemon], Error> {
        guard let jsonData = data else { return .failure(error!) }
        do {
            let decoder = JSONDecoder()
            let data = try decoder.decode(PokemonDataResponse.self, from: jsonData)
            let pokemonsList = data.results
            return .success(pokemonsList)
        } catch let error {
            print("parseData failure \(error.localizedDescription)")
            return .failure(error)
        }
    }
    
    private func handleResponseImage(data: Data?, error: Error?) -> Result<UIImage, Error> {
        guard let imageData = data, let image = UIImage(data: imageData) else { return .failure(error!) }
        return .success(image)
    }
    
}
