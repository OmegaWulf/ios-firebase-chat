//
//  MessageModel.swift
//  firebasePractice
//
//  Created by Nikita Thomas on 1/8/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit
import MessageKit

class MessageThread {
    let title: String?
    var messages: [Message]?
    let identifier: String?
    
    init(title: String, messages: [Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }
    
    init(dictionary: [String: AnyObject]) {
        self.title = dictionary["title"] as? String
        self.identifier = dictionary["identifier"] as? String
    }
    
    
}
