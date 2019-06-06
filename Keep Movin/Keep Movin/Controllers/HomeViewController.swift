//
//  FirstViewController.swift
//  Keep Movin
//
//  Created by Arthur Melo on 04/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia

class HomeViewController: UIViewController {
    
    let helloText = "Olá, Arthur"
    let message = "Sua atividade"
    
    enum Cards: Int {
        case Performance
        case Ranking
        case Stickers
        case History
    }
    
    @IBOutlet weak var cardsCollectionView: UICollectionView!
    
    let performanceCellId = "performance"
    let rankingCellId = "ranking"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavBar()
        cardsCollectionView.register(PerformanceCell.self, forCellWithReuseIdentifier: performanceCellId)
        cardsCollectionView.register(RankingCell.self, forCellWithReuseIdentifier: rankingCellId)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        
        self.title = helloText + "\n" + message
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .largeTitle)
        ]
        
        self.navigationController?.navigationBar.barTintColor = UIColor().navBarColor()
        
        for navItem in(navigationController?.navigationBar.subviews)! {
            for itemSubView in navItem.subviews {
                if let largeLabel = itemSubView as? UILabel {
                    largeLabel.text = self.title
                    largeLabel.numberOfLines = 2
                }
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let card = Cards(rawValue: indexPath.row) else { return PerformanceCell() }
        
        switch card {
        case .Performance:
            let performanceCell = collectionView.dequeueReusableCell(withReuseIdentifier: performanceCellId,
                                                                     for: indexPath) as! PerformanceCell
            return performanceCell
        case .Ranking:
            let rankingCell = collectionView.dequeueReusableCell(withReuseIdentifier: rankingCellId,
                                                                     for: indexPath) as! RankingCell
            return rankingCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 37, bottom: 0, right: 37)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
}
