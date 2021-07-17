//
//  UserService.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 15/07/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserDataService {
    
    class func getListUsers(forPage page: Int = 0, completion: @escaping (_ response: [User]) ->()) {
        print("\(#function)")
        AF.request(URL_USERS+"1",method: .get, parameters: nil,encoding: JSONEncoding.default,headers: ["Content-Type":"application/json"]).responseJSON { response in
            var users = [User]()
            switch response.result {
                case .success(let value):
                    do {
                        guard  let parsedData = try? JSON(data: response.data!) else {
                            return
                        }
                        print(parsedData["data"])

                        for item in parsedData["data"].array! {
                            let id = item["id"].intValue
                            let email = item["email"].stringValue
                            let firstName = item["first_name"].stringValue
                            let lastName = item["last_name"].stringValue
                            let avatar = item["avatar"].stringValue
                            let user = User(id: id,email: email, firstName: firstName, lastName: lastName, avatar: avatar)
                            users.append(user)
                        }
                        completion(users)
                    }
                    break
                   case .failure(let error):
                        print("Could not get list users \(error.localizedDescription)")
                        completion([])
                        break
            }
        }
    }
    
    class func getUserDetail(userId id: Int, completion: @escaping (_ response: User?) -> ()) {
        print(#function)
        print("\(URL_USER)\(id)")
        AF.request("\(URL_USER)\(id)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Content-Type":"application/json"]).responseJSON { response in
            print("\(#function) 👉👉👉👉👉👉\(response)")
            switch response.result {
            case .success(_):
                    do {
                        guard  let parsedData = try? JSON(data: response.data!) else {
                            completion(nil)
                            return
                        }
                        print(parsedData["data"])
                        let item = parsedData["data"]
                        let id = item["idb"].intValue
                        let email = item["email"].stringValue
                        let firstName = item["first_name"].stringValue
                        let lastName = item["last_name"].stringValue
                        let avatar = item["avatar"].stringValue
                        let user = User(id: id,email: email, firstName: firstName, lastName: lastName, avatar: avatar)
                        completion(user)
                    }
                    break
                   case .failure(let error):
                        print("Could not get user \(error.localizedDescription)")
                        completion(nil)
                        break
            }
        }
    }
    
    
    
}

