//
//  NewMessageViewModel.swift
//  Messenger
//
//  Created by Edgar Vergara on 22/08/23.
//

import Foundation
import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws{
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        var users = try await UserService.fetchAllUsers()
        self.users = users.filter({ $0.id != currentUid })
    }
}
