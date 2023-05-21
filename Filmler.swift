//
//  Filmler.swift
//  FİLMLER UYGULAMA
//
//  Created by Enes Durmuşoğlu on 17.05.2023.
//

import Foundation

class Filmler {
    
    var filmId : Int?
    var filmBaslık : String?
    var filmResimAdı: String?
    var filmFiyat: Double?
    
    init() {
        
    }
    
    init(filmId: Int, filmBaslık: String, filmResimAdı: String, filmFiyat: Double) {
        self.filmId = filmId
        self.filmBaslık = filmBaslık
        self.filmResimAdı = filmResimAdı
        self.filmFiyat = filmFiyat
    }
}
