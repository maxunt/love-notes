//
//  SignUpScreen.swift
//  love-notes
//
//  Created by Max U on 9/22/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpScreen: View {
    @EnvironmentObject var user: LocalUser
    @State var email: String = ""
    @FocusState var emailFieldIsFocused: Bool
    @State var password: String = ""
    @FocusState var passwordFieldIsFocused: Bool
    @State var displayError = false
    @State var errorMessage = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color.pink
                    .ignoresSafeArea()
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 600, height: 300)
                        .rotationEffect(Angle(degrees: 25))
                    Text("Sign Up")
                        .font(.system(size: 72, design: .rounded))
                        .foregroundColor(Color.white)
                }.offset(CGSize(width: 0, height: -200))

                VStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 300, height: 100)
                        VStack {
                            Text("Email: ")
                                .frame(width: 250)
                                .offset(CGSize(width: -100, height: 0))
                                .font(.system(size: 24, design: .rounded))
                            // .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                            TextField(
                                "max@gmail.com",
                                text: $email
                            )
                            .frame(width: 250, height: 50)
                            .focused($emailFieldIsFocused)
                            .onSubmit {
                                print("email submitted")
                            }
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .border(.secondary)
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(Color.white)
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 300, height: 100)
                        VStack {
                            Text("Password: ")
                                .frame(width: 250)
                                .offset(CGSize(width: -80, height: 0))
                                .font(.system(size: 24, design: .rounded))
                                .foregroundColor(Color.white)
                            SecureField(
                                "password",
                                text: $password
                            )
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(Color.white)
                            .frame(width: 250, height: 50)
                            .focused($passwordFieldIsFocused)
                            .onSubmit {
                                print("password submitted")
                            }
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .border(.secondary)
                        }
                    }
                    
                    Button(action: {
                        SignUp()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 150, height: 100)
                            Text("Sign Up")
                                .font(.system(size: 24, design: .rounded))
                                .foregroundColor(Color.white)
                        }.offset(CGSize(width: 0, height: 30))
                    }).padding(.bottom, 15)
                }
                
                // Error message
                if displayError {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 350, height: 100)
                            Text("Sign Up Failure: \(errorMessage)")
                                .frame(width: 300)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
    
    func SignUp() {
        Task {
            do {
                try await user.createUser(email: email, password: password)
            } catch {
                displayError = true
                errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    SignUpScreen().environmentObject(LocalUser())
}
