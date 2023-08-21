//
//  ContentViewModel.swift
//  Messenger
//
//  Created by Edgar Vergara on 21/08/23.
//

import Combine
import Firebase
import Foundation

class ContentViewModel: ObservableObject {
    private let authService = AuthService.shared
    
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSuscribers()
    }
    
    private func setupSuscribers() {
        authService.$userSession.sink { userSession in
            self.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
