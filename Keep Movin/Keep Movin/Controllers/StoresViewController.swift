//
//  StoresViewController.swift
//  Keep Movin
//
//  Created by Arthur Melo on 05/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit

class StoresViewController: UIViewController {
    
    let message = "Seus pontos: 4890"
    let productCellId = "productCell"
    var products: [KMProduct] = []
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavBar(title: nil, message: message)
        productsCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: productCellId)
        ProductsManager.shared.fetchProducts { (products) in
            if products != nil, products!.count > 0 {
                self.products = products!
                self.productsCollectionView.reloadData()
            }
        }
    }
}

extension StoresViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellId, for: indexPath) as! ProductCell
        cell.storeName.text = products[indexPath.row].storeName
        cell.storeImage.downloaded(from: products[indexPath.row].storeImgUrl, contentMode: .scaleAspectFill)
        cell.productDescription.text = products[indexPath.row].productDesc
        cell.productImage.downloaded(from: products[indexPath.row].productImgUrl, contentMode: .scaleAspectFill)
        return cell
    }
}
