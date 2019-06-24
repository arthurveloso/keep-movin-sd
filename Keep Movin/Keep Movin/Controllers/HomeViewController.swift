//
//  FirstViewController.swift
//  Keep Movin
//
//  Created by Arthur Melo on 04/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia
import CoreMotion

class HomeViewController: UIViewController {

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
    let stickersCellId = "stickers"
    let pedometer = CMPedometer()
    var steps: String?
    var orderedUsersDic: [String: Int]? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar(title: nil, message: message)

        cardsCollectionView.register(PerformanceCell.self, forCellWithReuseIdentifier: performanceCellId)
        cardsCollectionView.register(RankingCell.self, forCellWithReuseIdentifier: rankingCellId)
        cardsCollectionView.register(StickersCell.self, forCellWithReuseIdentifier: stickersCellId)
        setupPedometer()
        let usersManager = UsersManager()
        var usersDic: [String: Int]? = [:]
        usersManager.fetchAllUsers { (users) in
            if let users = users, users.count > 0 {
                for user in users {
                    usersDic![user.username] = user.lifetimeSteps
                }
            }
            for (k,v) in (Array(usersDic!).sorted {$0.0 < $1.0}) {
                self.orderedUsersDic![k] = v
            }
            print(self.orderedUsersDic!)
            self.cardsCollectionView.reloadData()
        }
    }
    
    func setupPedometer() {
        let calendar = Calendar.current
        
        pedometer.queryPedometerData(from: calendar.startOfDay(for: Date()), to: Date()) { (data, error) in
            if data != nil {
                DispatchQueue.main.async {
                    self.steps = "\(data!.numberOfSteps)"
                    self.cardsCollectionView.reloadData()
                }
            }
        }
        
        pedometer.startUpdates(from: calendar.startOfDay(for: Date())) { (data, error) in
            if data != nil {
                DispatchQueue.main.async {
                    self.steps = "\(data!.numberOfSteps)"
                    self.cardsCollectionView.reloadData()
                    UsersManager.shared.updateStepsCounter(steps: Int(self.steps!)!)
                }
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let card = Cards(rawValue: indexPath.row) else { return PerformanceCell() }
        
        switch card {
        case .Performance:
            let performanceCell = collectionView.dequeueReusableCell(withReuseIdentifier: performanceCellId,
                                                                     for: indexPath) as! PerformanceCell
            performanceCell.progressLabel.text = "Sem dados"
            if let stepsText = steps {
                let attributedText = NSMutableAttributedString()
                let stepsString = NSAttributedString(string: stepsText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24, weight: .semibold)])
                let descriptionString = NSAttributedString(string: "\npassos", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .light)])
                attributedText.append(stepsString)
                attributedText.append(descriptionString)
                performanceCell.progressLabel.attributedText = attributedText
            }
            return performanceCell
        case .Ranking:
            let rankingCell = collectionView.dequeueReusableCell(withReuseIdentifier: rankingCellId,
                                                                 for: indexPath) as! RankingCell
            rankingCell.friends = orderedUsersDic
            return rankingCell
        case .Stickers:
            let stickersCell = collectionView.dequeueReusableCell(withReuseIdentifier: stickersCellId, for: indexPath) as! StickersCell
            stickersCell.stickers = stickersCell.stickers(passos: Int(steps!)!)
            print(stickersCell.stickers)
            stickersCell.setupViews()
            return stickersCell
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
