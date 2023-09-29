//
//  LoginHomePage.swift
//  love-notes
//
//  Created by Max U on 9/21/23.
//

import SwiftUI

struct LoginHomePage: View {
    @EnvironmentObject var user: LocalUser
    var body: some View {
        NavigationView {
            ZStack {
                Color.pink
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"),Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 650, height: 300)
                        .rotationEffect(Angle(degrees: 25))
                    Text("Love Notes")
                        .font(.system(size: 72, design: .rounded))
                        .frame(width: 300)
                        .foregroundColor(Color.white)
                        
                        
                }
                .offset(CGSize(width: 0, height: -200))
                ZStack {
                    VStack {
                        NavigationLink(destination: LoginScreen().environmentObject(self.user)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .foregroundColor(Color("JaxOrange"))
                                    .frame(width: 300, height: 100)
                                Text("Login")
                                    .font(.system(size: 32, design: .rounded))
                                    .foregroundColor(Color.white)
                            }
                        }
                        NavigationLink(destination: SignUpScreen().environmentObject(self.user)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .foregroundColor(Color("JaxOrange"))
                                    .frame(width: 300, height: 100)
                                Text("Sign Up")
                                    .font(.system(size: 32, design: .rounded))
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                }.offset(CGSize(width: 0,height: 200))
                
            }
            .ignoresSafeArea()
        }.navigationTitle("Login Home")
    }
}

#Preview {
    LoginHomePage().environmentObject(LocalUser())
}
