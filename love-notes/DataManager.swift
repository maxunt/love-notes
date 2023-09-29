//
//  DataManager.swift
//  love-notes
//
//  Created by Max U on 9/26/23.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct DBUser: Codable {
    /// @DocumentID var id: String?
    var receivedMessages: [String]
    var sentMessages: [String]
    var createdat: Date
    var UUID: String
    var lover: String
    var name: String
    var email: String
}

class DataManager: ObservableObject {
    let db = Firestore.firestore()
    
    func createUser(user: DBUser) async throws {
        let document = db.collection("Users").document(user.email)
        try document.setData(from: user)
    }
    
    func getUser(email: String) async throws -> DBUser {
        //var user: DBUser?
        let ref = db.collection("Users").document(email)
        return try await ref.getDocument(as: DBUser.self)
    }
    
    func sendMessageToUser(message: String, toEmail: String, fromEmail: String) async throws {
        var toUser = try await getUser(email: toEmail)
        var fromUser = try await getUser(email: fromEmail)
        toUser.receivedMessages.append(message)
        fromUser.sentMessages.append(message)
        try await createUser(user: toUser)
        try await createUser(user: fromUser)
    }
}
