//
//  ProductCell.swift
//  Keep Movin
//
//  Created by Arthur Melo on 05/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
//    var storeImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor().cellColor()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
//        sv(storeImage)
//        storeImage.top(5).left(5)
//        storeImage.height(10).width(10)
    }
}
