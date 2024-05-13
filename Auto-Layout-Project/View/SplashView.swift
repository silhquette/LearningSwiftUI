//
//  SplashView.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 25/04/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        LogoView()
    }
}

#Preview {
    SplashView()
}

// membuat komponen sederhana
struct LogoView: View {
    var body: some View {
        Image(systemName: "figure.walk")
            .resizable()
                .frame(width: 100, height: 140)
                .foregroundColor(.white)
            .padding()
            .background(Color("PrimaryColor"))
            .cornerRadius(20)
    }
}
