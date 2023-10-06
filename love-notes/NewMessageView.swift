//
//  NewMessageView.swift
//  love-notes
//  Firebase FireStore setup tutorial:  https://www.youtube.com/watch?v=XhD_Y6kLJqk
//  Created by Max U on 9/17/23.
//

import SwiftUI

struct NewMessageView: View {
    @State var message:String = ""
    @State var valid:Bool?
    @State var displayError = false
    @State var errorMessage = ""
    
    @EnvironmentObject var user: LocalUser
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 100)
                        .padding()
                    Text("Craft a message to \(user.dbUser?.lover ?? "Unknown Lover")")
                        .font(.system(size: 32, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding()
                }
                TextEditor(text: $message)
                    .frame(width: 375)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(.white)
                    .font(.system(size: 24, design: .rounded))
                    .fontWeight(.heavy)
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(Color("JaxOrange")))
                
                NavigationLink (destination: HomePage().environmentObject(user).navigationBarBackButtonHidden(true), tag: true, selection: $valid) {
                    Button(action: {
                        sendMessage()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 150, height: 100)
                            Text("Send")
                                .font(.system(size: 24, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                        }
                    })
                }
                
                // Error message
                if displayError {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 350, height: 100)
                            Text("Failure: \(errorMessage)")
                                .frame(width: 300)
                        }
                        Spacer()
                    }
                }
            }
            
        }
    }
    
    func sendMessage() {
        if message == "" {
            return
        }
        
        Task {
            do {
                try await user.sendMessage(message)
                valid = true
            } catch {
                displayError = true
                errorMessage = error.localizedDescription
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView().environmentObject(LocalUser())
    }
}
