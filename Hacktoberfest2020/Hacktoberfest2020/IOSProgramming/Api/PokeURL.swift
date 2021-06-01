//
//  PokeApi.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 30/01/2021.
//

import Foundation

let baseURL = "https://pokeapi.co/api/v2"

enum EndPoint : String {
    case pokemons = "/pokemon?"
}

struct PokeURL {
    
    static func pokeURL(url: EndPoint, parameters: [String: String]? ) -> URL{
        let fullUrl = baseURL + url.rawValue
        var components = URLComponents(string: fullUrl)!
        var queryItems = [URLQueryItem]()

        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
    }
}
