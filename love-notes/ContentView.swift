 //
//  ContentView.swift
//  love-notes
//  Firebase FireStore setup tutorial:  https://www.youtube.com/watch?v=XhD_Y6kLJqk
//
//  Created by Max U on 9/17/23.
//

import SwiftUI

enum KeyValue: String {
    case userEmail, userPass
}

struct ContentView: View {
    
    @EnvironmentObject var user: LocalUser
    var body: some View {
//        // If all setup is finished
//        if user.isLoggedIn && user.isSetUp {
//            NewMessageView().environmentObject(user)
//            // If needs setting up
//        } else if user.isLoggedIn {
//            EnterName().environmentObject(user)
//        } else {
//            LoginHomePage().environmentObject(user)
//        }
        if user.hasName && user.hasLover {
            HomePage().environmentObject(user)
        } else if !user.isLoggedIn {
            LoginHomePage().environmentObject(user)
        } else if !user.hasName {
            EnterName().environmentObject(user)
        } else if !user.hasLover {
            FindLover().environmentObject(user)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocalUser())
    }
}
