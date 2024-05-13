//
//  ContentView.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    // Menangkap global object
    @ObservedObject var user: UserObject
    
    var body: some View {
        GeometryReader {
            geo in
            
            VStack (spacing: 12) {
                Text("Hello, \(self.user.username)!")
                TextField("Username", text: self.$user.username)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(width: geo.size.width/1.3)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    ContentView(user: UserObject())
}
