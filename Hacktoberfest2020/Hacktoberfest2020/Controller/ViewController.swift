//
//  ViewController.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/9/20.
//

import UIKit
import Alamofire
import SwiftyJSON

struct Post: Decodable {
    public private(set) var id: Int
    public private(set) var  body: String
    public private(set) var  userId: Int
    public private(set) var  title: String
}

class ViewController: UIViewController {

    private let HOST = "https://reqres.in"
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //getListUser()
        
//        createUser(userCreate: ["name" : "Anonymous", "job" : "developer"]) { response, status in
//        }
        updateUser(userEdit: ["id" : 328,
                              "job" : "PM",
                              "name" : "Anonymous"]) { response, status in
            
        }
    }
    
    func updateUser(userEdit user: [String: Any], completion: (_ response: Any,_ status: Bool) -> ()) {
        print("\(#function)")
        let id = user["id"] as! Int
        let name = user["name"] as! String
        let job = user["job"] as! String
        AF.request(HOST+"/api/users/\(id)", method: .put, parameters: ["name" : name, "job": job]).responseJSON { response in
//            success({
//                job = PM;
//                name = Anonymous;
//                updatedAt = "2021-07-14T16:37:54.835Z";
//            })
            print(response)
        }
    }
    
    
    func createUser(userCreate user : [String: Any], completion: ((_ response: Any,_ status: Bool) ->())) {
        print("\(#function)")
        let name = user["name"] as! String
        let job = user["job"] as! String
        AF.request(HOST+"/api/users", method: .post, parameters: ["name": name, "job": job]).responseJSON { response in
//            success({
//                createdAt = "2021-07-14T16:29:12.134Z";
//                id = 328;
//                job = developer;
//                name = Anonymous;
//            })
            print(response)
        }
    }
    
    
    func getListUser() {
        print("\(#function)")
        print(HOST+"/api/users?page=1")
        AF.request(HOST+"/api/users?page=1",method: .get, parameters: nil,encoding: JSONEncoding.default,headers: ["Content-Type":"application/json"]).responseJSON { response in
            print(response)
        }
    }
    
    func getAllPosts() {
        AF.request("https://jsonplaceholder.typicode.com/posts", method: .get, parameters: nil, encoding: JSONEncoding.default, headers:  ["Content-Type": "application/json"]).responseJSON { response in
            guard let results = response.value else {
                print("Could not fetch data \(response.error?.localizedDescription)")
                return}
            //First
            var convertedData : [[String : Any]] = []
            for data in results as! [[String: Any]]{
                let body = data["body"] as! String
                let id = data["id"] as! Int
                let title = data["title"] as! String
                let userId = data["userId"] as! Int
                convertedData.append(["body": body,"id": id,"title": title,"userId": userId,])
            }
            print("🌻 \(convertedData[0])")
            //Second
            var postArray = [Post]()
            guard let data = response.data else {return}
            if let json = JSON(data).array {
                for item in json {
                    let body = item["body"].stringValue
                    let id = item["id"].intValue
                    let title = item["title"].stringValue
                    let userId = item["userId"].intValue
                    
                    let obj = Post(id: id, body: body, userId: userId, title: title)
                    postArray.append(obj)
                }
            }
            print("🌻 \(postArray[0])")
        }
    }

}

