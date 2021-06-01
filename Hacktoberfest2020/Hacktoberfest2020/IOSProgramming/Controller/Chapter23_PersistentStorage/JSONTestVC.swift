//
//  JSONTestVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 25/01/2021.
//

import UIKit

let json = """
     [
       {
         "id": 2237,
         "date": "2014-03-28T09:01:07",
         "title": {
           "rendered": "Wim Hovens"
         },
         "content": {
           "rendered": "<p>Good design is in all the things you notice. Great design is in all the things you dont",
           "protected": false
         }
       }
     ]
"""

let json2 = """
[
    {
      "categoryName": "Trending",
      "Trending": [
        {
          "category": "Trending",
          "price": 20.5,
          "isFavourite": true,
          "isWatchlist": null
        }
      ]
    },
    {
      "categoryName": "Comedy",
      "Comedy": [
        {
          "category": "Comedy",
          "price": 24.32,
          "isFavourite": null,
          "isWatchlist": false
        }
      ]
    }
]
"""
//--------------------------------------DEMO 1------------------------------------------------------
struct Item3: Decodable {
    let value : String
    //https://stackoverflow.com/questions/47078826/in-swift-why-is-codingkey-the-protocol-i-see-being-used-with-enums-for-use-of-t
    enum CodingKeys: String, CodingKey{
        case value = "rendered"
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        value = try values.decode(String.self, forKey: .value)
//    }
}

struct QuoteL1 : Decodable {
    let author : Item3
    let tag : Item3
    enum CodingKeys : String, CodingKey {
        case author = "title"
        case tag = "content"
    }
}

struct  QuoteL2 : Decodable {
    let author : String
    let quotation : String
    enum CodingKeys : String, CodingKey {
        case author = "title"
        case quotation = "content"
    }
    private struct Item2 : Decodable{
        let value : String
        enum CodingKeys: String, CodingKey {
            case value = "rendered"
        }
    }
    init(from decoder: Decoder) throws {
        let con = try decoder.container(keyedBy: CodingKeys.self)
        let author = try con.decode(Item2.self, forKey: .author)
        self.author = author.value
        let quotation = try con.decode(Item2.self, forKey: .quotation)
        self.quotation = quotation.value
    }
}
struct QuoteL3 : Decodable {
    struct AnyCodingKey : CodingKey {
      var stringValue: String
      var intValue: Int?

      init(_ codingKey: CodingKey) {
        self.stringValue = codingKey.stringValue
        self.intValue = codingKey.intValue
      }

      init(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
      }

      init(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
      }
    }
    init(from decoder: Decoder) throws {
        let con = try decoder.container(keyedBy: AnyCodingKey.self)
        let keys = con.allKeys
        print(keys)
    }
}

struct Quote : Decodable {
    let author : String
    let quotation : String
    enum CodingKeys : String, CodingKey {
        case author = "title"
        case quotation = "content"
    }
    private struct Item : Decodable {
        let value : String
        enum CodingKeys : String, CodingKey {
            case value = "rendered"
        }
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let author = try values.decode(Item.self, forKey: .author)
        self.author = author.value
        let quotation = try values.decode(Item.self, forKey: .quotation)
        self.quotation = quotation.value
    }
}

//----------------------------------DEMO 2-------------------------------------
struct Inner : Decodable {
    let category : String
    let price : Double
    let isFavorite: Bool?
    let isWatchlist: Bool?
    
    enum CodingKeys : String, CodingKey {
        case category
        case price
        case isWatchlist
        case isFavorite = "isFavourite"
    }
    
}

struct Outer : Decodable {
    let categoryName : String
    let data : [Inner2]
    struct Inner2 : Decodable{
        let category : String
        let price : Double
        let isFavorite: Bool?
        let isWatchlist: Bool?
        
        enum CodingKeys : String, CodingKey {
            case category
            case price
            case isWatchlist
            case isFavorite = "isFavourite"
        }
    }
    private struct CK: CodingKey{
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let con = try decoder.container(keyedBy: CK.self)
        self.categoryName = try con.decode(String.self, forKey: CK(stringValue: "categoryName")!)
        self.data = try con.decode([Inner2].self, forKey: CK(stringValue: self.categoryName)!)
    }
}

class JSONTestVC: UIViewController {

    let sess: URLSession = {
        let config = URLSessionConfiguration.ephemeral
        let s = URLSession(configuration: config)
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "JSON"
        
        fetchData()
       
    }
    func demo2() {
        print("---------------------------PARSE JSON DEMO 2--------------------------------------")
        let jsonData2 = json2.data(using: .utf8)!
        if let data = try? JSONDecoder().decode([Outer].self, from: jsonData2) {
            print(data)
        }
    }
    
    func demo1() {
        print("---------------------------PARSE JSON DEMO--------------------------------------")
     
        let jsonData = json.data(using: .utf8)!
        if let arr = try? JSONDecoder().decode([QuoteL3].self, from: jsonData) {
            let quote = arr.first!
            print(quote)
        }
    }
    
    func fetchData() {
        
        // https://quotesondesign.com/wp-json/wp/v2/posts/?orderby=rand
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "quotesondesign.com"
        comp.path = "/wp-json/wp/v2/posts"
        var qi = [URLQueryItem]()
        qi.append(URLQueryItem(name: "orderby", value: "rand"))
        comp.queryItems = qi
        if let url = comp.url {
            let d = self.sess.dataTask(with: url){
                data,_,_ in
                if let data = data {
                    DispatchQueue.main.async {
                        print("----------Parse data--------")
                        self.parse(data)
                    }
                }
            }
            d.resume()
        }
    }
    
    func parse(_ data: Data) {
        struct Quote : Decodable {
            let author : String
            let quotation : String
            enum CodingKeys : String, CodingKey {
                case author = "title"
                case quotation = "content"
            }
            
            struct Item : Decodable{
                let value : String
                enum CodingKeys : String, CodingKey {
                    case value = "rendered"
                }
            }
            init(from decoder: Decoder) throws {
                let con = try decoder.container(keyedBy: CodingKeys.self)
                let author = try con.decode(Item.self, forKey: .author)
                self.author = author.value
                let quotation = try con.decode(Item.self, forKey: .quotation)
                self.quotation = quotation.value
            }
        }
        
        print(String(data: data, encoding: .utf8))
        if let arr = try? JSONDecoder().decode([Quote].self, from: data) {
            let quote = arr.first!
            print(quote)
        }
    }

}
