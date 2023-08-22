//
//  AuthService.swift
//  Messenger
//
//  Created by Edgar Vergara on 21/08/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    
    init( ) {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            loadCurrentUserData()
            
            self.userSession = result.user
        } catch {
            print("DEBUG: failed to sign in user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            try await uploadUserData(id: result.user.uid, email: email, fullname: fullname)
            loadCurrentUserData()
            
            self.userSession = result.user
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print("DEBUG: failed to sign out with error \(error.localizedDescription)")
        }
        
    }
    
    func uploadUserData(id: String,  email: String, fullname: String) async throws {
        let user = User(fullname: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    private func loadCurrentUserData() {
        Task { try await UserService.shared.fetchCurrentUser() }
    }
}
