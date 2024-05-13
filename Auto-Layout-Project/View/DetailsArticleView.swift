//
//  DetailsArticleView.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 26/04/24.
//

import SwiftUI

struct DetailsArticleView: View {
    @State private var isLiked: Bool = false
    @State private var articleDetails: Bool = false
    
    var body: some View {
        ScrollView {
            VStack (spacing: 24) {
                Image("thumbnail")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                VStack (alignment: .leading) {
                    HStack {
                        Text("Lifestyle")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                            .background(.gray.opacity(0.1))
                            .cornerRadius(24)
                        Spacer()
                        if !isLiked {
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .padding(.horizontal, 8)
                                .onTapGesture {
                                    self.isLiked = true
                                }
                        } else {
                            Image(systemName: "heart.fill")
                                .padding(.horizontal, 8)
                                .imageScale(.large)
                                .foregroundColor(.red)
                                .onTapGesture {
                                    self.isLiked = false
                                }
                        }
                        Button(action: {self.articleDetails.toggle()}) {
                            Image(systemName: "paperplane")
                                .imageScale(.large)
                                .padding(.horizontal, 8)
                                .foregroundColor(.black)
                        }
                    }
                    Text("Ini Adalah Headline yang Sangat Menarik Hingga Saya Ingin Membacanya")
                        .font(.title)
                        .fontWeight(.bold)
                    HStack(spacing: 8) {
                        Image("Profile-Photo")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .clipShape(Circle())
                        Text("Michel Nainggolan")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 2, height: 2)
                        Text("23 mins ago")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width - 36, alignment: .leading)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Details Article")
        .sheet(isPresented: $articleDetails) {
            ShareView()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .padding(.vertical, 24)
        }
    }
}

struct ShareView: View {
    @State var searchUser: String = ""
    let users = [
        UserModel(id: 1, username: "RivanaAulia", photo: "aa"),
        UserModel(id: 2, username: "MichelFirdaus", photo: "ab"),
        UserModel(id: 3, username: "FitraTora", photo: "ac"),
        UserModel(id: 4, username: "Silhquette", photo: "ad"),
        UserModel(id: 5, username: "UrBbyGurl", photo: "ae"),
        UserModel(id: 6, username: "Ardhfe", photo: "af"),
        UserModel(id: 7, username: "KasimMubarok", photo: "ag"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(keyword: $searchUser)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16, content: {
                    ForEach(users) { user in
                        VStack {
                            Image(user.photo)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                            Text(user.username)
                                .font(.footnote)
                        }
                    }
                })
            }
            .padding()
            .navigationBarTitle("Bagikan Artikel", displayMode: .inline)
            .searchable(text: $searchUser)
        }
    }
}



#Preview {
    ShareView()
}
