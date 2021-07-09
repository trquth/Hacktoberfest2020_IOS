//
//  Message.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 07/07/2021.
//

import Foundation

class Message {
    private var _content: String
    private var _senderId: String
    
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
