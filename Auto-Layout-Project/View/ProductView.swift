//
//  ProductView.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 05/05/24.
//

import SwiftUI

struct ProductView: View {
    @State private var searchText = ""
    @ObservedObject var fetch = ProductServices()
    
    var body: some View {
        List(fetch.products) { product in
            HStack {
                AsyncImage(url: URL(string: product.gambar)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipped()
                    default:
                        ProgressView() // Placeholder saat gambar sedang diunduh
                    }
                }
                VStack (alignment: .leading, spacing: 2) {
                    Text(product.nama)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Rp \(product.harga)")
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationBarTitle("Product")
        .searchable(text: $searchText)
    }
}

#Preview {
    ProductView()
}
