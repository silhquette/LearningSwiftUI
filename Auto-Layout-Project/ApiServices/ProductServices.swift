//
//  ProductServices.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 05/05/24.
//

import Foundation
import SwiftUI

class ProductServices : ObservableObject {
    @Published var products = [ProductModel]()
    
    init() {
        guard let url = URL(string: "https://computers-shop.vercel.app/computers") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let productData = data {
                    let decodedData = try JSONDecoder().decode([ProductModel].self, from: productData)
                    DispatchQueue.main.async {
                        self.products = decodedData // Update the published property on the main thread
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
