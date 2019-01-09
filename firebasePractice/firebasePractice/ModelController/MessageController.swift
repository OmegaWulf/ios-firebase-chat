//
//  MessageController.swift
//  firebasePractice
//
//  Created by Nikita Thomas on 1/8/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit
import MessageKit


class MessageController {
    
    func messageToDictValues(message: Message) -> [String: Any] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        
        let sentDate = dateFormatter.string(from: message.sentDate!)
        
        let sender = ["id": message.sender?.id, "displayName": message.sender?.displayName]
        
        let values = ["messageId": message.messageId!, "sendDate": sentDate, "sender": sender, "kind": message.kind!] as [String: Any]
        
        return values
    }
    
    
}
