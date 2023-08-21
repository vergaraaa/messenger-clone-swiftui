//
//  LoginViewModel.swift
//  Messenger
//
//  Created by Edgar Vergara on 21/08/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService().login(withEmail: email, password: password)
    }
}
