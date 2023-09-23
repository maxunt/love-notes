//
//  NewMessageView.swift
//  love-notes
//  Firebase FireStore setup tutorial:  https://www.youtube.com/watch?v=XhD_Y6kLJqk
//  Created by Max U on 9/17/23.
//

import SwiftUI

struct NewMessageView: View {
    @State var message:String = ""
    @State var title:String = ""
    var body: some View {
        ZStack {
            VStack {
                Text("Craft a love note for {user}")
                TextField(
                    "Title your note? (optional)",
                    text: $title
                )
                TextField(
                    "Your message here",
                    text: $message
                )
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
