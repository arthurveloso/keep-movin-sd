//
//  ProductCell.swift
//  Keep Movin
//
//  Created by Arthur Melo on 05/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia

class ProductCell: UICollectionViewCell {
    var storeImage = UIImageView()
    var storeName = UILabel()
    var productImage = UIImageView()
    var productDescription = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        sv(storeImage)
        storeImage.contentMode = .scaleAspectFit
        storeImage.heightEqualsWidth()
        storeImage.width(40).top(10).Leading == safeAreaLayoutGuide.Leading + 30
        storeImage.layer.cornerRadius = 20
        storeImage.layer.masksToBounds = true
        
        sv(storeName)
        storeName.Leading == storeImage.Trailing + 10
        storeName.Trailing == safeAreaLayoutGuide.Trailing - 30
        storeName.CenterY == storeImage.CenterY
        
        sv(productImage)
//        productImage.image = UIImage(named: "tenis")
        productImage.contentMode = .scaleAspectFill
        productImage.Top == storeImage.Bottom + 10
        productImage.Leading == storeImage.Leading
        productImage.Trailing == safeAreaLayoutGuide.Trailing - 30
        productImage.height(70%)
        productImage.layer.cornerRadius = 10
        productImage.layer.masksToBounds = true
        productImage.layer.borderWidth = 0.5
        productImage.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        
        sv(productDescription)
        productDescription.Leading == productImage.Leading
        productDescription.Top == productImage.Bottom + 10
        productDescription.Trailing == safeAreaLayoutGuide.Trailing - 30
        
    }
}
