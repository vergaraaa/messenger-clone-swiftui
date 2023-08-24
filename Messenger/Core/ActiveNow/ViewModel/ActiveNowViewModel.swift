//
//  ActiveNowViewModel.swift
//  Messenger
//
//  Created by Edgar Vergara on 24/08/23.
//

import Firebase
import Foundation

class ActiveNowViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers(limit: 3)
        
        self.users = users.filter({ $0.id != currentUid })
    }
}
