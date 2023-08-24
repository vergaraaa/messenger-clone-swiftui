//
//  InboxViewModel.swift
//  Messenger
//
//  Created by Edgar Vergara on 22/08/23.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()
        
    private let service = InboxService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
        service.observeRecentMessages()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { currentUser in
            self.currentUser = currentUser
        }
        .store(in: &cancellables)
        
        service.$documentChanges.sink { changes in
            self.loadInitialMessages(fromChanges: changes)
        }
        .store(in: &cancellables)
    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]) {
        let messages = changes.compactMap({ try? $0.document.data(as: Message.self)})
        
        for i in 0 ..< messages.count {
            var message = messages[i]

            UserService.fetchUser(withUid: message.chartPartnerId) { user in
                message.user = user
                
                if let existingConversationIndex = self.recentMessages.firstIndex(where: { $0.user?.uid == user.uid }) {
                    self.recentMessages[existingConversationIndex] = message
                } else {
                    self.recentMessages.append(message)
                }

                self.recentMessages.sort(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() })
            }
        }
    }
}
