//
//  UserModel.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 02/05/24.
//

import Foundation

// Define Model Data
struct UserModel : Identifiable {
    var id: Int // Identifiable harus punya ID
    let username: String
    let photo: String
    
    init(id: Int, username: String, photo: String) {
        self.id = id
        self.username = username
        self.photo = photo
    }
}
