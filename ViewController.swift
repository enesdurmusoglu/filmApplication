//
//  ViewController.swift
//  FİLMLER UYGULAMA
//
//  Created by Enes Durmuşoğlu on 17.05.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tasarim : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.filmCollectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let hucreGenislik = (genislik-30)/2
        
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.6)
        
        filmCollectionView!.collectionViewLayout = tasarim
        
        filmCollectionView.delegate  = self
        filmCollectionView.dataSource = self 
        
        let f1 = Filmler(filmId: 1, filmBaslık: "Django", filmResimAdı: "django", filmFiyat: 39.99)
        let f2 = Filmler(filmId: 2, filmBaslık: "Inception", filmResimAdı: "inception", filmFiyat: 39.99)
        let f3 = Filmler(filmId: 3, filmBaslık: "Interstellar", filmResimAdı: "interstellar", filmFiyat: 39.99)
        let f4 = Filmler(filmId: 4, filmBaslık: "Anadoluda", filmResimAdı: "birzamanlaranadoluda", filmFiyat: 39.99)
        let f5 = Filmler(filmId: 5, filmBaslık: "The Hateful Eight", filmResimAdı: "thehatefuleight", filmFiyat: 39.99)
        let f6 = Filmler(filmId: 6, filmBaslık: "The Pianist", filmResimAdı: "thepianist", filmFiyat: 39.99)
        
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, FilmHucreProtocol {
    func sepeteEkle(indexPath: IndexPath) {
        
        let film = filmlerListesi[indexPath.row]
        print("\(film.filmBaslık!) filmi sepete eklendi")
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"filmHucre", for: indexPath) as! FilmHucre
        
        cell.filmAdıLabel.text = film.filmBaslık!
        cell.filmFiyatLabel.text = "\(film.filmFiyat!) TL"
        cell.filmImageView.image = UIImage(named: film.filmResimAdı!)
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.filmBaslık!) filmi seçildi")
    }
}





