//
//  File.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 30/01/2021.
//

import Foundation

struct Pokemon: Codable {
    var name : String
    var url: String?
    
    init() {
        name = ""
        url = nil
    }
//    enum CokingKeys : String, CodingKey {
//        case name
//        case thumbnail = "url"
//    }
}
