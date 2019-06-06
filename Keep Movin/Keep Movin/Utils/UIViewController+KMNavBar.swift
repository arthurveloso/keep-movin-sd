//
//  File.swift
//  Keep Movin
//
//  Created by Arthur Melo on 05/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavBar(helloText: String, message: String) {
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
