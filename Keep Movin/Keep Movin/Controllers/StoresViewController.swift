//
//  StoresViewController.swift
//  Keep Movin
//
//  Created by Arthur Melo on 05/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit

class StoresViewController: UIViewController {

    let helloText = "Olá, Arthur"
    let message = "Seus pontos: 4890"
    let productCellId = "productCell"
    let stores = ["Centauro", "Netshoes"]
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavBar(helloText: helloText, message: message)
        productsCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: productCellId)
    }
}

extension StoresViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellId, for: indexPath) as! ProductCell
//        cell.storeImage = UIImageView(image: UIImage(named: stores[indexPath.row]))
        return cell
    }
    
    
}
