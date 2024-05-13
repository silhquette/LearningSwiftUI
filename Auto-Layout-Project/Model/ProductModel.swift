//
//  ProductModel.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 05/05/24.
//

import Foundation
import SwiftUI

struct ProductModel : Codable, Identifiable {
    public let id: String
    public let nama: String
    public let harga: String
    public let gambar: String
    public let tipe: String
    public let deskripsi: String
    
    init(id: String, nama: String, harga: String, gambar: String, tipe: String, deskripsi: String) {
        self.id = id
        self.nama = nama
        self.harga = harga
        self.gambar = gambar
        self.tipe = tipe
        self.deskripsi = deskripsi
    }
}
