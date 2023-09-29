//
//  FindLover.swift
//  love-notes
//
//  Created by Max U on 9/24/23.
//

import SwiftUI
import FirebaseAuth

struct FindLover: View {
    @EnvironmentObject var user: LocalUser
    @State var email: String = ""
    @FocusState var emailIsFocused
    @State var displayError = false
    @State var errorMessage = ""
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [Color("JaxOrange"), Color("JaxOrange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 700, height: 300)
                    .rotationEffect(Angle(degrees: 25))
                Text("Let's find your lover!")
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
                        Text("Lover's Email: ")
                            .frame(width: 250)
                            .offset(CGSize(width: 0, height: 0))
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(Color.white)
                        TextField(
                            "email",
                            text: $email
                        )
                        .frame(width: 250, height: 50)
                        .focused($emailIsFocused)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .font(.system(size: 24, design: .rounded))
                        .foregroundColor(Color.white)
                        .border(.secondary)
                    }
                }
                
                Button(action: {
                    pairLovers()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [.orange, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 150, height: 100)
                        Text("Next")
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(Color.white)
                    }.offset(CGSize(width: 0, height: 50))
                }).padding(.bottom, 25)
                
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
    
    func pairLovers() {
        Task {
            do {
                try await user.addLover(email: email)
            } catch {
                displayError = true
                errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    FindLover().environmentObject(LocalUser())
}
