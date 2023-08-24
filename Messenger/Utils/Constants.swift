//
//  Constants.swift
//  Messenger
//
//  Created by Edgar Vergara on 23/08/23.
//

import Firebase
import Foundation

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
