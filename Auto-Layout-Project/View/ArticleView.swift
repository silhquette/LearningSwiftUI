//
//  ArticleView.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 26/04/24.
//

import SwiftUI

struct ArticleView: View {
    @State private var searchText = ""
    let articles = [
        ArticleModel(id: 1, title: "Artikel satu ini bisa memiliki dua baris", author: "Fitra Syawal", time: 3),
        ArticleModel(id: 2, title: "Artikel dua satu baris", author: "Michel Nainggolan", time: 8),
        ArticleModel(id: 3, title: "Artikel tiga ini juga memiliki dua baris bahkan lebih dari dua baris", author: "Penulis satu", time: 20),
        ArticleModel(id: 4, title: "Artikel satu ini bisa memiliki dua baris", author: "Fitra Syawal", time: 3),
        ArticleModel(id: 5, title: "Artikel dua satu baris", author: "Michel Nainggolan", time: 8),
        ArticleModel(id: 6, title: "Artikel tiga ini juga memiliki dua baris bahkan lebih dari dua baris", author: "Penulis satu", time: 20),
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 24, content: {
                ForEach(articles) { article in
                    NavigationLink (destination: DetailsArticleView()) {
                        CardView(article: article)
                    }
                    
                }
            })
            .padding(.horizontal, 24)
            .searchable(text: $searchText)
        }
        .navigationBarTitle("Articles Dirubah")
    }
}

struct CardView: View {
    let article: ArticleModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Lifestyle")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(24)
                }
                Text(self.article.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                HStack(spacing: 8) {
                    Image("Profile-Photo")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .clipShape(Circle())
                    Text(self.article.author)
                        .foregroundColor(.gray)
                        .font(.caption)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 2, height: 2)
                    Text("\(self.article.time) mins ago")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Image("thumbnail")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .cornerRadius(8)
        }
    }
}

struct SearchBar: View {
    @Binding var keyword: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $keyword)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .padding(.leading, 24)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                                .frame(alignment: .leading), alignment: .leading
                        )
            
            if !keyword.isEmpty {
                Button(action: {
                    self.keyword = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}


#Preview {
    ArticleView()
}
