//
//  love_notesApp.swift
//  love-notes
//
//  Created by Max U on 9/17/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct love_notesApp: App {    
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var user = LocalUser()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(user)
        }
    }
}
