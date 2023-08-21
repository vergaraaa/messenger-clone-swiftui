//
//  LoginViewModel.swift
//  Messenger
//
//  Created by Edgar Vergara on 21/08/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let authService = AuthService.shared
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await authService.login(withEmail: email, password: password)
    }
}
