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
    let stores = [["nome": "Centauro", "produto": "tenis", "descricao": "De 229,99 por 199,99 + 15 mil pontos"], ["nome": "Netshoes", "produto": "natacao", "descricao": "De 59,99 por 29,99 + 10 mil pontos"]]
    
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
        cell.storeImage.image = UIImage(named: stores[indexPath.row]["nome"]!)
        cell.storeName.text = stores[indexPath.row]["nome"]!
        cell.productImage.image = UIImage(named: stores[indexPath.row]["produto"]!)
        cell.productDescription.text = stores[indexPath.row]["descricao"]!
        return cell
    }
    
    
}
