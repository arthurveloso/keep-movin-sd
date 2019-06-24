//
//  ProductsManager.swift
//  Keep Movin
//
//  Created by Arthur Melo on 24/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import Foundation
import Firebase

class ProductsManager {
    
    static let shared: ProductsManager = ProductsManager()

    private var productsRef: DatabaseReference {
        return Database.database().reference().child("Stores")
    }

    func fetchProducts(completion: @escaping(_ products: [KMProduct]?) -> Void) {
        var products: [KMProduct] = []
        productsRef.observe(.value) { (snapshot) in
            if let productsDic = snapshot.value as? [String: Any] {
                for (_, value) in productsDic {
                    if let val = value as? [String: Any] {
                        let product = KMProduct()
                        product.storeName = val["storeName"] as! String
                        product.productDesc = val["productDesc"] as! String
                        product.storeImgUrl = val["storeImgUrl"] as! String
                        product.productImgUrl = val["productImgUrl"] as! String
                        products.append(product)
                    }
                }
                completion(products)
            }
        }
    }
}
