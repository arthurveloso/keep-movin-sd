//
//  File.swift
//  Keep Movin
//
//  Created by Arthur Melo on 05/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavBar(title: String?, message: String) {
        navigationController?.navigationBar.prefersLargeTitles = true

        UsersManager.shared.getCurrentUser { (user) in
            if user != nil {
                self.title = "Olá, \(String(describing: user!.username))" + "\n" + message
            } else {
                self.title = "Olá, atleta" + "\n" + message
            }
        }

        if title != nil {
            self.title = title! + "\n" + message
        }
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .largeTitle)
        ]
        
        self.navigationController?.navigationBar.barTintColor = UIColor().navBarColor()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
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
