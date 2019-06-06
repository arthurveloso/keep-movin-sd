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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavBar(helloText: helloText, message: message)
    }
}
