//
//  SecondViewController.swift
//  Keep Movin
//
//  Created by Arthur Melo on 04/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia

class ProfileViewController: UIViewController {

    let helloText = "Olá, Arthur"
    let message = "Seu perfil"
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileInfoTableView: UITableView!

    enum Infos: Int {
        case Age
        case Gender
        case Weight
        case Height
        case BMI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavBar(helloText: helloText, message: message)
        setupViews()
    }
    
    func setupViews() {
        profileNameLabel.text = "Arthur Melo"
        profileNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.clipsToBounds = true
        
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let info = Infos(rawValue: indexPath.row) else { return UITableViewCell() }
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "profile")
        
        var cellTitle = ""
        var cellContent = ""
        switch info {
        case .Age:
            cellTitle = "Idade:"
            cellContent = "23 anos"
            break;
        case .BMI:
            cellTitle = "IMC:"
            cellContent = "29,0 - Sobrepeso"
            break;
        case .Gender:
            cellTitle = "Gênero:"
            cellContent = "Masculino"
            break;
        case .Height:
            cellTitle = "Altura:"
            cellContent = "1,78 m"
            break;
        case .Weight:
            cellTitle = "Peso:"
            cellContent = "92 kg"
            break;
        }
        cell.textLabel?.text = cellTitle
        cell.detailTextLabel?.text = cellContent
        return cell
    }
}
