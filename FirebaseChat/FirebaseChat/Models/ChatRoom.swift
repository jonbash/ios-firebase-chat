//
//  ChatRoom.swift
//  FirebaseChat
//
//  Created by Jon Bash on 2019-12-17.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

struct ChatRoom {
    var name: String
    let id: String
    var messages: [Message]
    
    init(name: String, id: String = UUID().uuidString, messages: [Message] = []) {
        self.name = name
        self.id = id
        self.messages = messages
    }
}

// MARK: - Codable

extension ChatRoom: Codable {
    enum CodingKeys: CodingKey {
        case name
        case id
        case messages
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let name = try container.decode(String.self, forKey: .name)
        let id = try container.decode(String.self, forKey: .id)
        let messages = try container.decode([Message].self, forKey: .messages)
        
        self.init(name: name, id: id, messages: messages)
    }
}