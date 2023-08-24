//
//  Route.swift
//  Messenger
//
//  Created by Edgar Vergara on 24/08/23.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
