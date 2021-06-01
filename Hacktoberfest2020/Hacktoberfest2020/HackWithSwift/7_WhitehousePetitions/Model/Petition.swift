//
//  Petition.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/11/2020.
//

import Foundation

struct Petition : Codable {
    var title : String
    var body : String
    var signatureCount : Int
}
