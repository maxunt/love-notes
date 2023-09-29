//
//  EnterName.swift
//  love-notes
//
//  Created by Max U on 9/24/23.
//

import SwiftUI
import FirebaseAuth

struct EnterName: View {
    @EnvironmentObject var user: LocalUser
    @State var name: String = ""
    @FocusState var nameIsFocused
    @State var displayError = false
    @State var errorMessage = ""
    @State var isReady = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 600, height: 300)
                        .rotationEffect(Angle(degrees: 25))
                    Text("What is your name?")
                        .font(.system(size: 64, design: .rounded))
                        .foregroundColor(Color.white)
                        .frame(width:400)
                }.offset(CGSize(width: 0, height: -200))
                
                // Name field
                VStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 300, height: 150)
                        VStack {
                            Text("Name: ")
                                .frame(width: 250)
                                .offset(CGSize(width: -80, height: 0))
                                .font(.system(size: 24, design: .rounded))
                                .foregroundColor(Color.white)
                            TextField(
                                "name",
                                text: $name
                            )
                            .frame(width: 250, height: 50)
                            .focused($nameIsFocused)
                            .textInputAutocapitalization(.words)
                            .disableAutocorrection(true)
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(Color.white)
                            .border(.secondary)
                        }
                    }
                    Button(action: {
                        setName()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 150, height: 100)
                            Text("Next")
                                .font(.system(size: 24, design: .rounded))
                                // .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                        }.offset(CGSize(width: 0, height: 50))
                    })
                    .padding(.bottom, 25)
                }
                
                // Error message
                if displayError {
                    VStack {
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 350, height: 100)
                            Text("Failure: \(errorMessage)")
                                .frame(width: 300)
                        }
                    }
                }
            }
        }
    }
    
    func setName() {
        print("setting user name")
        guard var dbUser = user.dbUser else {
            return
        }
        dbUser.name = name
        Task {
            do {
                try await user.updateUser(dbUser)
                isReady = true
                print("name set success")
            } catch {
                displayError = true
                errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    EnterName().environmentObject(LocalUser())
}
