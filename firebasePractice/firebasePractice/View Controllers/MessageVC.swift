//
//  ChatVC.swift
//  firebasePractice
//
//  Created by Nikita Thomas on 1/8/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit
import MessageKit

class MessageVC: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    
    var user: User!
    var messages: [Message]?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    
    }
    
    
    
    func currentSender() -> Sender {
        return Sender(id: user.id!, displayName: user.name!)
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        guard messages != nil else { return 0 }
        
        return messages?.count ?? 0
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        
        return    messages?[indexPath.section]
    }
    
    
    


}
