//
//  ChatMessageCell.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/13/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    
    var chatMessage: ChatMessage! {
        didSet{
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .green : .blue
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bubbleBackgroundView: UIView = {
        let bubble = UIView()
        bubble.backgroundColor = .yellow
        bubble.layer.cornerRadius = 12
        bubble.translatesAutoresizingMaskIntoConstraints = false
        return bubble
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
        
        //Let set constrains for label
        let constrains = [
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
        ]
        
        NSLayoutConstraint.activate(constrains)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        leadingConstraint.isActive = false
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        trailingConstraint.isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

