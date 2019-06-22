//
//  UsersManager.swift
//  Keep Movin
//
//  Created by Arthur Melo on 21/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import Foundation
import Firebase

class UsersManager {
    
    static let shared: UsersManager = UsersManager()
    
    private var usersRef: DatabaseReference {
        return Database.database().reference().child("Users")
    }
    
//    init(<#parameters#>) {
//        <#statements#>
//    }

    func createUser(user: KMUser, uid: String, completion: @escaping(_ hero: KMUser?, _ error: Error?) -> Void) {
        let userChild = usersRef.child(uid)
        
        userChild.updateChildValues(["username": user.username,
                                     "age": user.age,
                                     "email": user.email,
                                     "genre": user.genre,
                                     "height": user.height,
                                     "weight": user.weight]) { (error, reference) in
                                        if error != nil {
                                            completion(nil, error)
                                            return
                                        }
                                        completion(user, nil)
        }
    }
    
    func getCurrentUser(completion: @escaping(_ user: KMUser?) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        self.usersRef.child(uid).observe(.value) { (snapshot) in
            if let dic = snapshot.value as? [String: Any] {
                let user = KMUser()
                user.age = dic["age"]! as! Int
                user.email = dic["email"]! as! String
                user.username = dic["username"]! as! String
                user.height = dic["height"] as! Int
                user.weight = dic["weight"] as! Int
                user.genre = dic["genre"] as! String
                completion(user)
                return
            }
            completion(nil)
        }
    }
}
