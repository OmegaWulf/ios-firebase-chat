//
//  Message.swift
//  firebasePractice
//
//  Created by Nikita Thomas on 1/8/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit
import MessageKit


struct Message {
    var sender: Sender?
    var messageId: String?
    var sentDate: Date?
    var kind: MessageKind?
    
    init(text: String, sender: Sender, timestamp: Date = Date()) {
        self.kind = .text(text)
        self.sender = sender
        self.sentDate = timestamp
        self.messageId = UUID().uuidString
    }
    
    init(dictionary: [String: AnyObject]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        
        if let hasSender = dictionary["sender"] as? [String: AnyObject] {
            guard let id = hasSender["id"] as? String else { return }
            guard let displayName = hasSender["displayName"] as? String else { return }
            
            self.sender = Sender(id: id, displayName: displayName)
        }
        
        if let hasSentDate = dictionary["sentDate"] as? String {
            guard let finalDate = dateFormatter.date(from: hasSentDate) else { return }
            self.sentDate = finalDate
        }
        
        self.messageId = dictionary["messageId"] as? String ?? ""
        
        if let hasKind = dictionary["kind"] as? [String: AnyObject] {
            guard let text = hasKind["text"] as? String else { return }
            
            self.kind = MessageKind.text(text)
        }
    }
    
    
    
}
