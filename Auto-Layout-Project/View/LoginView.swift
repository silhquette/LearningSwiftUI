//
//  LoginView.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 25/04/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 24) {
            Image("otp-security")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            VStack(alignment: .leading, spacing: 6, content: {
                Text("Login Page").font(.largeTitle).bold()
                Text("Login to continue using the app")
                    .foregroundColor(.gray)
            })
            .frame(width: UIScreen.main.bounds.width - 64, alignment: .leading)
            FormBox()
        }
        .padding(.bottom, 100)
    }
}

#Preview {
    LoginView()
}

struct FormBox: View {
    
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username").font(.callout).bold()
            TextField("your_username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 12)
            
            Text("Password").font(.callout).bold()
            TextField("password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 12)
            
            Button(action: {print("helo")}) {
                // Label("Sign In", systemImage: "arrow.forward.to.line.square")
                Text("Sign In")
                    .frame(maxWidth: .infinity)
                    .padding(.all, 12)
                    .background(Color("MyPrimaryColor"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 64, alignment: .leading)
    }
}
