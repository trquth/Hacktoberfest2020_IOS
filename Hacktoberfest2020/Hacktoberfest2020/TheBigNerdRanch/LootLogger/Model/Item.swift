//
//  Item.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 28/11/2020.
//

import UIKit

class Item : Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name &&
            lhs.serialNumber == rhs.serialNumber &&
            lhs.valueInDollars == rhs.valueInDollars &&
            lhs.dateCreate == rhs.dateCreate
    }
    
    var name : String
    var valueInDollars : Int
    var serialNumber : String?
    let dateCreate: Date
    
    init(name : String, serialNumber : String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreate = Date()
    }
    
    convenience init(random : Bool = false){
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Sport", "Mac"]
            let randomAdjective = adjectives.randomElement()!
            let randomNoun = nouns.randomElement()!
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            
            let randomValue = Int.random(in: 0..<100)
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars : randomValue)
        }else{
            self.init(name: "" , serialNumber: nil, valueInDollars : 0)
        }
    }
}
