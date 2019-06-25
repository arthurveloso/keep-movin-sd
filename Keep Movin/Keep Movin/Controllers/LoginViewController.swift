//
//  LoginViewController.swift
//  Keep Movin
//
//  Created by Nickson Kley Gonçalves Da Silva on 12/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia
import Firebase

class LoginViewController: UIViewController{
    
    // MARK: Outlets
    @IBOutlet weak var IconImageView: UIImageView!
    @IBOutlet weak var UserTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var OrLabel: UILabel!
    @IBOutlet weak var SignUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.style()
        self.layout()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupNavBar(title: "Keep Movin'", message: "")
    }
    
    private func style(){
        UserTextField.placeholder = "E-mail"
        UserTextField.keyboardType = .emailAddress
        
        PasswordTextField.placeholder = "Senha"
        PasswordTextField.isSecureTextEntry = true
        
        LogInButton.text("Entrar")
        LogInButton.tintColor = .white
        LogInButton.layer.cornerRadius = 10
        LogInButton.layer.backgroundColor = UIColor().navBarColor().cgColor
        
        LogInButton.addTarget(self, action: #selector(checkUser), for: .touchUpInside)
        
        OrLabel.text("ou")
        
        SignUpButton.text("Criar conta")
        SignUpButton.tintColor = .white
        SignUpButton.layer.cornerRadius = 10
        SignUpButton.layer.backgroundColor = UIColor().navBarColor().cgColor
    }
    
    private func layout() {
        //Add components in screen
        guard let nav =  self.view else { return }
        nav.sv(self.IconImageView,
               self.UserTextField,
               self.PasswordTextField,
               self.LogInButton,
               self.OrLabel,
               self.SignUpButton)
        self.IconImageView.height(30%)
        self.IconImageView.centerHorizontally().width(70%).Top == nav.safeAreaLayoutGuide.Top
        
        self.UserTextField.centerHorizontally().width(75%).height(40).Top == IconImageView.Bottom + 20
        
        self.PasswordTextField.centerHorizontally().width(75%).height(40).Top == UserTextField.Bottom + 20
        
        self.LogInButton.centerHorizontally().width(50%).height(40).Bottom == OrLabel.Top - 10
        
        self.OrLabel.centerHorizontally().Bottom == SignUpButton.Top - 10
        
        self.SignUpButton.bottom(5%).centerHorizontally().width(50%).height(40)
        
    }
    
    @objc func checkUser(){
        
        guard let userName = UserTextField.text, let password = PasswordTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: userName, password: password, completion: {
            (authResult, error) in
            if let error = error, authResult == nil {
                let alert = UIAlertController(title: "Log In falhou", message: error.localizedDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            }
            
            guard let page = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as? UITabBarController else {
                return
            }
            
            self.showDetailViewController(page, sender: nil)
            
        })
        
    }
    
}
