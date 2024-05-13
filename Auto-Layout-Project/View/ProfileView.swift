//
//  ProfileView.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 25/04/24.
//

import SwiftUI

struct ProfileView: View {
    // Menangkap global object
    @ObservedObject var user: UserObject
    
    var body: some View {
        NavigationView(content: {
                Form() {
                    // section profile
                    Section() {
                        HStack(spacing: 16) {
                            Image("Profile-Photo")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            VStack(alignment: .leading ,spacing: 4) {
                                Text(self.user.username)
                                Text("124210038@student.upnyk.ac.id")
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                            }
                        }
                        HStack(spacing: 16) {
                            Image(systemName: "person.text.rectangle.fill")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                                .frame(width: 30)
                            Text("Edit Personal Information")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.medium)
                                .foregroundColor(.gray)
                        }
                        HStack(spacing: 16) {
                            Image(systemName: "lock.square.fill")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                                .frame(width: 30)
                            Text("Security Settings")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.medium)
                                .foregroundColor(.gray)
                        }
                    }
                }.navigationBarTitle("Profile")
        })
    }
}

#Preview {
    ProfileView(user: UserObject())
}
