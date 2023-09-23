//
//  LoginHomePage.swift
//  love-notes
//
//  Created by Max U on 9/21/23.
//

import SwiftUI

struct LoginHomePage: View {
    var body: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink,.red], startPoint: .topLeading, endPoint: .bottomTrailing))
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginHomePage()
}
