//
//  CorporeInformationViewController.swift
//  Keep Movin
//
//  Created by Nickson Kley Gonçalves Da Silva on 12/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import UIKit
import Stevia
import Firebase

class CorporeInformationViewController: UIViewController {
    
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var AgeTextField: UITextField!
    @IBOutlet weak var HeightTextField: UITextField!
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var GenreTextField: UITextField!
    @IBOutlet weak var SaveButton: UIButton!
    
    var userName : String = ""
    var email : String = ""
    var password : String = ""
    var ref : DatabaseReference!
    var user : User!
    
    override func viewDidLoad() {
        self.style()
        self.layout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func style() {
        
        ProfileImageView.image = UIImage(named: "blob")
        
        AgeTextField.placeholder = "Age"
        
        HeightTextField.placeholder = "Height"
        
        WeightTextField.placeholder = "Weight"
        
        GenreTextField.placeholder = "Genre"
        
        SaveButton.text("Save")
        SaveButton.tintColor = .white
        SaveButton.layer.cornerRadius = 10
        SaveButton.layer.backgroundColor = UIColor().navBarColor().cgColor
        
        SaveButton.addTarget(self, action: #selector(firebaseRequest), for: .touchUpInside)
        
    }
    
    @objc func firebaseRequest(){
        
        Database.database().reference(withPath: "users")
        
        guard let age = self.AgeTextField.text, let height = self.HeightTextField.text, let weight = self.WeightTextField.text, let genre = self.GenreTextField.text else{ return }
        
        let dictionary = ["userName" : self.userName,
                            "Email" : self.email,
                            "Age" : age,
                            "Height" : height,
                            "Weight" : weight,
                            "Genre" : genre]
        
        self.ref.child("Users").child(user.uid).setValue(dictionary, withCompletionBlock: {
            (error, dataRef) in
            
            if error != nil{
                print(error)
                return
            }
            
            guard let page = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as? UITabBarController else { return }
            
            self.showDetailViewController(page, sender: nil)
            
        })
        
    }
    
    private func layout(){
        
        guard let nav =  self.view else { return }
        nav.sv(self.ProfileImageView,
               self.AgeTextField,
               self.HeightTextField,
               self.WeightTextField,
               self.GenreTextField,
               self.SaveButton)
        
        self.ProfileImageView.heightEqualsWidth().width(50%).centerHorizontally().Top == nav.safeAreaLayoutGuide.Top + 30
        
        self.AgeTextField.centerHorizontally().width(90%).height(40).Top == ProfileImageView.Bottom + 30
        
        self.HeightTextField.centerHorizontally().width(90%).height(40).Top == AgeTextField.Bottom + 15
        
        self.WeightTextField.centerHorizontally().width(90%).height(40).Top == HeightTextField.Bottom + 15
        
        self.GenreTextField.centerHorizontally().width(90%).height(40).Top == WeightTextField.Bottom + 15
        
        self.SaveButton.bottom(5%).centerHorizontally().width(50%).height(40)
        
    }
    
}
