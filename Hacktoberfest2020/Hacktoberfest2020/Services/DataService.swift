//
//  DataService.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 03/07/2021.
//

import Foundation
import Firebase


let DB_BASE = Database.database(url: "https://breakpoint-dev-20058-default-rtdb.asia-southeast1.firebasedatabase.app").reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    func getUsername(forUID uid: String, completion: @escaping (_ userName: String?) -> ())  {
        REF_USERS.observeSingleEvent(of: .value) { snapshot in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                completion("")
                return
            }
            for user in snapshot {
                if user.key == uid {
                    completion(user.childSnapshot(forPath: "email").value as? String)
                }
            }
        }
    }
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, completion: @escaping (_ status: Bool) -> ()) {
        if groupKey != nil {
            REF_GROUPS.child(groupKey!).child("messages").childByAutoId().updateChildValues(["content": message, "senderId": uid])
            completion(true)
        }else{
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            completion(true)
        }
    }
    
    
    func getAllFeedMessages(completion: @escaping (_ messages: [Message]) -> ()) {
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value) { snapshot in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(messageArray)
                return}
            for message in snapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderId: senderId)
                messageArray.append(message)
            }
            completion(messageArray)
        }
        
    }
    
    func getAllMessagesFor(desiredGroup: Group, completion: @escaping (_ messages : [Message]) -> ()) {
        var groupMessageArray = [Message]()
        REF_GROUPS.child(desiredGroup.key).child("messages").observeSingleEvent(of: .value) { snapshot in
            guard let groupMessages = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(groupMessageArray)
                return
            }
            for groupMessage in groupMessages {
                let content = groupMessage.childSnapshot(forPath: "content").value as! String
                let senderId = groupMessage.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderId: senderId)
                groupMessageArray.append(message)
                
            }
            completion(groupMessageArray)
        }
    }
    
    func getEmail(forSearchQuery query: String, completion: @escaping (_ emails: [String]) ->()) {
        var emails = [String]()
        REF_USERS.observe(.value) { snapshot in
            guard let users = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(emails)
                return
            }
            for user in users {
                let email = user.childSnapshot(forPath: "email").value as! String
                if email.contains(query) == true && email != Auth.auth().currentUser?.email {
                    emails.append(email)
                }
            }
            completion(emails)
        }
    }
    
    func getIds(forUsernames usernames: [String], completion: @escaping (_ uidArray: [String]) -> ())  {
        REF_USERS.observeSingleEvent(of: .value) { snapshot in
            var idArray = [String]()
            guard let users = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(idArray)
                return}
            for user in users {
                let email = user.childSnapshot(forPath: "email").value as! String
                if usernames.contains(email){
                    idArray.append(user.key)
                }
            }
            completion(idArray)
            
        }
    }
    
    func getEmails(forGroup group: Group, completion: @escaping (_ emails: [String]) -> ()) {
        var emailArray = [String]()
        REF_USERS.observeSingleEvent(of: .value) { snapshot in
            guard let users = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(emailArray)
                return
            }
            for user in users {
                if group.members.contains(user.key){
                    let email = user.childSnapshot(forPath: "email").value as! String
                    emailArray.append(email)
                }
            }
            completion(emailArray)
        }
    }
    
    func createGroup(withTitle title: String, andDescription description: String, forUserIds ids: [String], completion : @escaping (_ status: Bool) -> ()) {
        REF_GROUPS.childByAutoId().updateChildValues(["title": title,"description": description,"members": ids])
        completion(true)
    }
    
    func getAllGroups(completion: @escaping (_ groupArray: [Group]) -> ()) {
        var groupsArray = [Group]()
        REF_GROUPS.observeSingleEvent(of: .value) { snapshot in
            guard let groups = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(groupsArray)
                return
            }
            for group in groups {
                let memberArray = group.childSnapshot(forPath: "members").value as! [String]
                if memberArray.contains((Auth.auth().currentUser?.uid)!) {
                    let title = group.childSnapshot(forPath: "title").value as! String
                    let description = group.childSnapshot(forPath: "description").value as! String
                    
                    let group = Group(title: title, description: description, key: group.key, members: memberArray, memberCount: memberArray.count)
                    groupsArray.append(group)
                }
            }
            completion(groupsArray)
        }
    }
    
    
    
}
