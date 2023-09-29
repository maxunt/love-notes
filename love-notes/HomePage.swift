//
//  HomePage.swift
//  love-notes
//
//  Created by Max U on 9/27/23.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var user: LocalUser
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        // Button Header
                        ButtonHeader()
                        
                        // Title
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 600, height: 100)
                            Text("Your messages from \(user.dbUser?.lover ?? "Unknown Lover")")
                                .font(.system(size: 32, design: .rounded))
                                .foregroundColor(Color.white)
                                .frame(width:400)
                        }
                    }
                    
                    // Messages scroll
                    ScrollView {
                        ForEach(user.dbUser?.receivedMessages ?? ["User could not be found"], id: \.self) { message in
                            ZStack {
                                Text(message)
                                    .frame(width: 300)
                                    .padding()
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, design: .rounded))
                                    .background(
                                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                                        .fill(Color("JaxOrange")))
                            }
                        }
                    }
                }

            }
        }
    }
}

struct ButtonHeader: View {
    var body: some View {
        HStack {
            // Setting button
            NavigationLink {
                Settings()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 50, height: 50)
                    Image(systemName: "gearshape")
                        .font(.system(size: 40, design: .rounded))
                        .foregroundColor(Color.white)
                }
            }
            Spacer()
            
            // New Message button
            NavigationLink {
                NewMessageView()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 175, height: 75)
                    Text("New Message")
                        .font(.system(size: 24, design: .rounded))
                        .foregroundColor(Color.white)
                }
            }
        }.padding(.horizontal, 120.0)
    }
}

#Preview {
    HomePage().environmentObject(LocalUser())
}
