//
//  StickersCell.swift
//  Keep Movin
//
//  Created by Arthur Melo on 12/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia

class StickersCell: KMCards {
    
    let stickerCellId = "stickerCell"
//    let friends = ["Victor", "Eu", "Rodrigo", "Nickson", "Marcos"]
    var stickers = [String]()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    func setupViews() {
        let stickersLabel = UILabel()
        stickersLabel.text = "Stickers"
        stickersLabel.textAlignment = .center
        stickersLabel.textColor = .white
        stickersLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let stickersCollection = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        sv(stickersCollection, stickersLabel)
        stickersLabel.top(10).left(10).right(10)
        stickersCollection.backgroundColor = .clear
//        stickersCollection.direction
        stickersCollection.delegate = self
        stickersCollection.dataSource = self
        stickersCollection.Top == stickersLabel.Bottom + 8
        stickersCollection.left(0).right(0).bottom(0)
        stickersCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: stickerCellId)
    }
}

extension StickersCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stickers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: stickerCellId, for: indexPath)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 50
        cell.layer.masksToBounds = true
        cell.backgroundView = UIImageView(image: UIImage(named: stickers[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    
}

extension StickersCell{
    
    func stickers(passos: Int) -> [String] {
        
        var stickers = [String]()
        
        if passos > 1000{
            stickers.append("cristo")
        }
        if passos > 2000{
            stickers.append("eiffel")
        }
        if passos > 2888{
            stickers.append("empire")
        }
        
        return stickers
        
    }
    
}
