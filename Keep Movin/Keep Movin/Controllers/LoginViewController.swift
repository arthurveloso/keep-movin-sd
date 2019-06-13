//
//  LoginViewController.swift
//  Keep Movin
//
//  Created by Nickson Kley Gonçalves Da Silva on 12/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia

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
        setupNavBar(helloText: "Keep Movin'", message: "")
    }
    
    private func style(){
        
        IconImageView.image = UIImage(named: "loog")
        
        UserTextField.placeholder = "User"
        UserTextField.keyboardType = .emailAddress
        
        PasswordTextField.placeholder = "Password"
        PasswordTextField.isSecureTextEntry = true
        
        LogInButton.text("Log In")
        LogInButton.tintColor = .white
        LogInButton.layer.cornerRadius = 10
        LogInButton.layer.backgroundColor = UIColor().navBarColor().cgColor
        
        OrLabel.text("or")
        
        SignUpButton.text("Sign In")
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
        self.IconImageView.heightEqualsWidth()
        self.IconImageView.centerHorizontally().width(50%).Top == nav.safeAreaLayoutGuide.Top
        
        self.UserTextField.centerHorizontally().width(75%).height(40).Top == IconImageView.Bottom + 20
        
        self.PasswordTextField.centerHorizontally().width(75%).height(40).Top == UserTextField.Bottom + 20
        
        self.LogInButton.centerHorizontally().width(50%).height(40).Bottom == OrLabel.Top - 10
        
        self.OrLabel.centerHorizontally().Bottom == SignUpButton.Top - 10
        
        self.SignUpButton.bottom(5%).centerHorizontally().width(50%).height(40)
        
    }
    
}

//
//// Custom View
//class CustomView: UIView {
//    let buttom = UIButton.init()
//    let userName = UILabel.init()
//    let password = UILabel.init()
//
//
//    init() {
//        super.init(frame: CGRect.zero)
//        self.style()
//        self.layout()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func style() {
//        buttom.text("Click Button")
//        userName.text = "Label 01"
//        password.text = "Label 02"
//    }
//
//
//}
