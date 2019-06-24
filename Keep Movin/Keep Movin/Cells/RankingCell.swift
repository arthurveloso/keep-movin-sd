//
//  RankingCell.swift
//  Keep Movin
//
//  Created by Arthur Melo on 05/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia

class RankingCell: KMCards {

    var rankingTableView = UITableView()
    let rankingCellId = "rankingCell"
    var friends: [String: Int]? = ["Arthur":10] {
        didSet {
            rankingTableView.reloadData()
        }
    }
    var didLayoutSubviews = false

    override func layoutSubviews() {
        super.layoutSubviews()
        if !didLayoutSubviews {
            setupViews()
            didLayoutSubviews = true
        }
    }
    
    func setupViews() {
        let rankingLabel = UILabel()
        rankingLabel.text = "Ranking"
        rankingLabel.textAlignment = .center
        rankingLabel.textColor = .white
        rankingLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        
        sv(rankingTableView, rankingLabel)
        rankingLabel.top(10).left(10).right(10)
        rankingTableView.backgroundColor = .clear
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
        rankingTableView.Top == rankingLabel.Bottom + 8
        rankingTableView.left(0).right(0).bottom(0)
        rankingTableView.register(UITableViewCell.self, forCellReuseIdentifier: rankingCellId)
    }
}

extension RankingCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: rankingCellId)
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .white

        let key = Array(self.friends!.keys)[indexPath.row]
        let value = Array(self.friends!.values)[indexPath.row]
        
        cell.textLabel?.text = key
        cell.detailTextLabel?.text = "\(value)"
        
        return cell
    }
}
