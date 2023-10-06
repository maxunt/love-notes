//
//  User.swift
//  love-notes
//
//  Created by Max U on 9/23/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class LocalUser: ObservableObject {
    @Published var isLoggedIn = false
    @Published var hasName = false
    @Published var hasLover = false
    var user: User? = nil
    @Published var dbUser: DBUser? = nil
    var loverDBUser: DBUser? = nil
    
    var dbManager = DataManager()
    
    init() {
        Task {
            try? await loadFromBase()
        }
    }
    
    func loadFromBase() async throws {
        guard let currentUser = Auth.auth().currentUser else {
            isLoggedIn = false
            return
        }
        self.user = currentUser
        try await loginUser(currentUser)
        setScreenValues()
    }
    
    func addLover(email: String) async throws {
        if email == "" {
            return
        }
        let lover = try await self.getUser(email)
        loverDBUser = lover
        guard var dbUser = self.dbUser else {
            return
        }
        dbUser.lover = email
        try await self.updateUser(dbUser)
        setScreenValues()
    }
    
    func updateUser(_ user: DBUser) async throws {
        try await dbManager.createUser(user: user)
        self.dbUser = user
        setScreenValues()
    }
    
    func getUser(_ user: DBUser) async throws -> DBUser {
        return try await dbManager.getUser(email: user.email)
    }
    
    func getUser(_ email: String) async throws -> DBUser {
        return try await dbManager.getUser(email: email)
    }
    
    func loginUser(_ user: User) async throws {
        self.user = user
        try await self.dbUser = getUser(user.email ?? "no email")
        // try await addLover(email: dbUser!.lover)
        setScreenValues()
    }
    
    func login(email: String, password: String) async throws {
        let res = try await Auth.auth().signIn(withEmail: email, password: password)
        try await self.loginUser(res.user)
    }
    
    func createUser(email: String, password: String) async throws {
        let res = try await Auth.auth().createUser(withEmail: email, password: password)
        let dbUser = DBUser(receivedMessages: [], sentMessages: [], createdat: Date.now, UUID: res.user.uid, lover: "", name: "", email: email)
        // Create a new document
        try await dbManager.createUser(user: dbUser)
        self.dbUser = dbUser
        try await loginUser(res.user)
    }
    
    func setScreenValues() {
        DispatchQueue.main.async {
            if self.dbUser == nil {
                self.hasName = false
                self.hasLover = false
                self.isLoggedIn = false
                return
            }
            self.isLoggedIn = true
            if self.dbUser!.name != "" {
                self.hasName = true
            }
            
            if self.dbUser!.lover != "" {
                self.hasLover = true
            }
        }
    }
    
    func sendMessage(_ message: String) async throws {
        guard let dbUser = dbUser else {
            return
        }
        try await dbManager.sendMessageToUser(message: message, toEmail: dbUser.lover, fromEmail: dbUser.email)
    }
    
    func validateSetUp() -> Bool {
        let name = getName()
        if name == "" {
            return false
        }
        if dbUser!.lover == "" {
            return false
        }
        return true
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
        dbUser = nil
        user = nil
        loverDBUser = nil
        setScreenValues()
    }
    
    func refreshMessages() async throws {
        guard let dbUser = self.dbUser else {
            return
        }
        self.dbUser = try await self.getUser(dbUser)
    }
    
    func getName() -> String {
        guard let validUser = user else {
            return ""
        }
        guard let validName = validUser.displayName else {
            return ""
        }
        return validName
    }
}
