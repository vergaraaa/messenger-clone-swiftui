//
//  SignUpViewModel.swift
//  Messenger
//
//  Created by Edgar Vergara on 21/08/23.
//

import Foundation

class SignUpViewModel: ObservableObject {
    private let authService = AuthService.shared
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await authService.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
