//
//  RegisterViewController.swift
//  Keep Movin
//
//  Created by Nickson Kley Gonçalves Da Silva on 12/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var FirulaImageView: UIImageView!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var RePasswordTextField: UITextField!
    @IBOutlet weak var NextButton: UIButton!
    
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.style()
        self.layout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func style() {
        
        FirulaImageView.image = UIImage(named: "run")
        
        NameTextField.placeholder = "User Name"
        
        EmailTextField.placeholder = "E-mail"
        EmailTextField.keyboardType = .emailAddress
        
        PasswordTextField.placeholder = "Password"
        PasswordTextField.isSecureTextEntry = true
        
        RePasswordTextField.placeholder = "Confirm Password"
        RePasswordTextField.isSecureTextEntry = true
        
        NextButton.text("Continue")
        NextButton.tintColor = .white
        NextButton.layer.cornerRadius = 10
        NextButton.layer.backgroundColor = UIColor().navBarColor().cgColor
        
    }
    
    private func layout() {
        
        guard let nav =  self.view else { return }
        nav.sv(self.FirulaImageView,
               self.NameTextField,
               self.EmailTextField,
               self.PasswordTextField,
               self.RePasswordTextField,
               self.NextButton)
        
        self.FirulaImageView.Height == (self.FirulaImageView.Width / 2)
        self.FirulaImageView.width(110%).centerHorizontally().Top == nav.safeAreaLayoutGuide.Top
        
        self.NameTextField.centerHorizontally().width(90%).height(40).Top == FirulaImageView.Bottom + 30
        
        self.EmailTextField.centerHorizontally().width(90%).height(40).Top == NameTextField.Bottom + 15
        
        self.PasswordTextField.centerHorizontally().width(90%).height(40).Top == EmailTextField.Bottom + 15
        
        self.RePasswordTextField.centerHorizontally().width(90%).height(40).Top == PasswordTextField.Bottom + 15
        
         self.NextButton.bottom(5%).centerHorizontally().width(50%).height(40)
    }
    
}
