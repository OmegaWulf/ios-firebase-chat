//
//  MessageThreadController.swift
//  firebasePractice
//
//  Created by Nikita Thomas on 1/8/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit
import Firebase
import MessageKit
import FirebaseDatabase


class MessageThreadController {

    private var ref = Database.database().reference()


    func newChatRoomInFirebase(thread: MessageThread) {
        let newChatRef = ref.child("threads").child(thread.identifier!)

        let values = ["title": thread.title!, "identifier": thread.identifier!] as [String : Any]

        newChatRef.updateChildValues(values)
    }
    
    

    func getChatRoomsFromFirebase(completion: @escaping ([MessageThread]?) -> Void) {

        var threads: [MessageThread] = []

        ref.child("threads").observeSingleEvent(of: .value) { (snapshot) in

            for child in snapshot.children {
                let snap = child as! DataSnapshot
                if let dict = snap.value as? [String: AnyObject] {
                    let thread = MessageThread(dictionary: dict)
                    threads.append(thread)
                }
            }
            if threads.count > 0 {
                completion(threads)
            } else {
                completion(nil)
            }
        }
    }
    
    

    
    func createMessageInFirebase(forThread thread: MessageThread, message: Message) {

        let messageRef = ref.child("message").child(thread.identifier!).child(message.messageId!)

        let messageCont = MessageController()
        let values = messageCont.messageToDictValues(message: message)

        messageRef.updateChildValues(values)
    }

    func getMessagesFromFirebase(forThread thread: MessageThread, completion: @escaping ([Message]) -> Void) {

        var messages: [Message] = []

        ref.child("messages").child(thread.identifier!).queryOrdered(byChild: "sentDate").observeSingleEvent(of: .value) { (snapshot) in

            for child in snapshot.children {
                let snap = child as! DataSnapshot
                if let dict = snap.value as? [String: AnyObject] {
                    let message = Message(dictionary: dict)
                    messages.append(message)
                }
            }
            completion(messages)
        }
    }


}


