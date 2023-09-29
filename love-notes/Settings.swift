//
//  Settings.swift
//  love-notes
//
//  Created by Max U on 9/27/23.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var user: LocalUser
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 600, height: 100)
                    //                        .rotationEffect(Angle(degrees: 25))
                    Text("Settings")
                        .font(.system(size: 32, design: .rounded))
                        // .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .frame(width:400)
                }
                Text("Name: \(user.dbUser?.name ?? "Unknown name")")
                    .font(.system(size: 24, design: .rounded))
                    // .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .frame(width:400)
                Text("Email: \(user.dbUser?.email ?? "Unknown email")")
                    .font(.system(size: 24, design: .rounded))
                    // .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .frame(width:400)
                Text("Lover: \(user.dbUser?.lover ?? "Unknown lover")")
                    .font(.system(size: 24, design: .rounded))
                    // .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .frame(width:400)
                Spacer()
                Button(action: {
                    try? user.signOut()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 150, height: 100)
                        Text("Sign Out")
                            .font(.system(size: 24, design: .rounded))
                            // .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                    }
                })
            }.padding()
            
        }
    }
}

#Preview {
    Settings().environmentObject(LocalUser())
}
