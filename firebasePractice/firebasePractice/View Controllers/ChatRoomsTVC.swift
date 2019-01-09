//
//  ChatRoomsTVC.swift
//  firebasePractice
//
//  Created by Nikita Thomas on 1/8/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit

class ChatRoomsTVC: UITableViewController {
    
    var user: User?
    
    var threads: [MessageThread]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let threadCont = MessageThreadController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = User(id: UUID().uuidString, name: "Anon")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getThreads()
    }
    
    
    func getThreads() {
        threadCont.getChatRoomsFromFirebase { (threads) in
            if threads != nil {
                self.threads = threads!
            }
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return threads?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        guard threads != nil else { return cell }
        
        let cellThread = threads![indexPath.row]
        
        cell.textLabel?.text = cellThread.title
        

        return cell
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "chatRoomToMessages" {
            let dest = segue.destination as! MessageVC
            
            dest.user = user
        }
    }
    

}
