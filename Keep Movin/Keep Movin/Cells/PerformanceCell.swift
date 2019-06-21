//
//  PerformanceCell.swift
//  Keep Movin
//
//  Created by Arthur Melo on 05/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit

class PerformanceCell: KMCards {
    
    let todayLabel = UILabel()
    let progressLabel = UILabel()
    var didLayoutSubview = false
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    func setupViews() {
        sv(todayLabel)
        todayLabel.top(10).left(10).right(10)
        todayLabel.text = "Hoje"
        todayLabel.textAlignment = .center
        todayLabel.textColor = .white
        todayLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 150,y: 175), radius: 100, startAngle: -(CGFloat.pi / 2), endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(shapeLayer)
        
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.white.withAlphaComponent(0.5).cgColor
        trackLayer.lineWidth = 20
        trackLayer.strokeEnd = 1
        trackLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(trackLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0.3
        basicAnimation.duration = 1
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "")
        
        sv(progressLabel)
        progressLabel.textAlignment = .center
        progressLabel.numberOfLines = 2
        progressLabel.textColor = .white
        progressLabel.centerInContainer()
    }
}

