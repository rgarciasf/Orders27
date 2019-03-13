//
//  ChatController.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/13/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class ChatController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    
    let messagesFromServer =
        [
            ChatMessage(text: "Here is my first messages", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
            ChatMessage(text: "This is another longer message to fiil up my custom cell in each row of the section", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
            ChatMessage(text: "UITable view contains a number of row per section and a number item in each row and is necessary to override two method: numberOfRowsInSection and cellForRowAt", isIncoming: false, date: Date()),
            ChatMessage(text: "Very short message", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018")),
            ChatMessage(text: "Comming through this time", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
            ChatMessage(text: "Third message to activate a new section in the chat with one row ", isIncoming: true, date: Date.dateFromCustomString(customString: "10/31/2018"))
    ]
    
    fileprivate func attemptToAssembleGroupMessages() {
        print("Attempt to group our messages together based on Date property")
        
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
        //Provide a sorting for your keys
        let sortedKey = groupedMessages.keys.sorted()
        sortedKey.forEach { (key) in
            let values = groupedMessages[key]
            chatMessages.append(values ?? [])
        }
        
    }
    
    var chatMessages = [[ChatMessage]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attemptToAssembleGroupMessages()
        navigationItem.title = "Chat"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .black
            text = "Some string"
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.boldSystemFont(ofSize: 14)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 20, height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = DateHeaderLabel()
            
            label.text =  dateString
            
            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        
        //let chatMessage = chatMessages[indexPath.row]
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        
        
        cell.chatMessage = chatMessage
        //cell.isInComming = indexPath.row % 2 == 0
        
        return cell
    }
}
