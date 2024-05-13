//
//  ArticleModel.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 01/05/24.
//

import Foundation

// Define Model Data
struct ArticleModel : Identifiable {
    var id: Int // Identifiable harus punya ID
    let title: String
    let author: String
    let time: Int
    
    init(id: Int, title: String, author: String, time: Int) {
        self.id = id
        self.title = title
        self.author = author
        self.time = time
    }
}
