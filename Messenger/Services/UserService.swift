//
//  UserService.swift
//  Messenger
//
//  Created by Edgar Vergara on 21/08/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    static let shared = UserService()
    
    @Published var currentUser: User?
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        print(user)
        self.currentUser = user
    }
}