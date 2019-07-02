//
//  UITextField+KMStyle.swift
//  Keep Movin
//
//  Created by Arthur Melo on 01/07/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit

extension UITextField {
    func setDefaultStyle() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor().cellColor().cgColor
    }
}
