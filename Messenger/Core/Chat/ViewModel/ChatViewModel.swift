//
//  ChatViewModel.swift
//  Messenger
//
//  Created by Edgar Vergara on 22/08/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    let service: ChatService
    
    @Published var messageText = ""
    @Published var messages = [Message]()
    
    init (user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage() {
        service.sendMessage(messageText)
    }
}
