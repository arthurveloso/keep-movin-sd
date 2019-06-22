//
//  SecondViewController.swift
//  Keep Movin
//
//  Created by Arthur Melo on 04/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    let helloText = "Olá, Arthur"
    let message = "Seu perfil"
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileInfoTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    var currentUser: KMUser?
    
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
        UsersManager.shared.getCurrentUser { (user) in
            if user != nil {
                self.currentUser = user!
                self.setupViews()
                self.profileInfoTableView.reloadData()
            }
        }
    }
    
    func setupViews() {
        profileNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.clipsToBounds = true
        
        logoutButton.layer.borderWidth = 1.0
        logoutButton.layer.borderColor = UIColor().cellColor().cgColor
        logoutButton.layer.cornerRadius = 5
        logoutButton.layer.masksToBounds = true
        logoutButton.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
        
        if let user = currentUser {
            profileNameLabel.text = user.username
            
        } else {
            profileNameLabel.text = "No user name"
        }
    }
    
    @objc func logoutPressed() {
        do {
            try Auth.auth().signOut()
            guard let login = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateInitialViewController() else { return }
            UIApplication.shared.keyWindow?.rootViewController = login
        } catch {
            print("Error")
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let info = Infos(rawValue: indexPath.row) else { return UITableViewCell() }
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "profile")
        
        guard let user = currentUser else { return UITableViewCell() }
        
        var cellTitle = ""
        var cellContent = ""
        switch info {
        case .Age:
            cellTitle = "Idade:"
            if user.age != 0 {
                cellContent = "\(user.age)"
            } else {
                cellContent = "No data"
            }
            break;
        case .BMI:
            cellTitle = "IMC:"
            cellContent = "29,0 - Sobrepeso"
            break;
        case .Gender:
            cellTitle = "Gênero:"
            if user.genre != "" {
                cellContent = "\(user.genre)"
            } else {
                cellContent = "No data"
            }
            break;
        case .Height:
            cellTitle = "Altura:"
            if user.height != 0 {
                cellContent = "\(user.height)"
            } else {
                cellContent = "No data"
            }
            break;
        case .Weight:
            cellTitle = "Peso:"
            if user.weight != 0 {
                cellContent = "\(user.weight)"
            } else {
                cellContent = "No data"
            }
            break;
        }
        cell.textLabel?.text = cellTitle
        cell.detailTextLabel?.text = cellContent
        return cell
    }
}
