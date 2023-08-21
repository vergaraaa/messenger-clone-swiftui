//
//  AuthService.swift
//  Messenger
//
//  Created by Edgar Vergara on 21/08/23.
//

import Foundation
import Firebase
class AuthService {
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    
    init( ) {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: failed to sign in user with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: created user \(result.user.uid)")
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            
            self.userSession = nil
        } catch {
            print("DEBUG: failed to sign out with error \(error.localizedDescription)")
        }
        
    }
}
