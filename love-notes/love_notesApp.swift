//
//  love_notesApp.swift
//  love-notes
//
//  Created by Max U on 9/17/23.
//

import SwiftUI
import Firebase

@main
struct love_notesApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
