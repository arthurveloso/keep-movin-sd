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

    func createUser(user: KMUser, uid: String, completion: @escaping(_ hero: KMUser?, _ error: Error?) -> Void) {
        let userChild = usersRef.child(uid)
        
        userChild.updateChildValues(["username": user.username,
                                     "age": user.age,
                                     "email": user.email,
                                     "genre": user.genre,
                                     "height": user.height,
                                     "weight": user.weight,
                                     "lifetimeSteps": user.lifetimeSteps]) { (error, reference) in
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
                user.lifetimeSteps = dic["lifetimeSteps"] as! Int
                completion(user)
                return
            }
            completion(nil)
        }
    }
    
    func updateStepsCounter(steps: Int) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        self.usersRef.child(uid).updateChildValues(["lifetimeSteps": steps]) { (error, data) in
            if error == nil {
                print("Steps updated")
            }
        }
    }
    
    public func fetchAllUsers(completion: @escaping(_ users: [KMUser]?) -> Void) {
        var users: [KMUser] = []
        self.usersRef.observe(.value) { (snapshot) in
            if let usersDic = snapshot.value as? [String: Any] {
                for (_, value) in usersDic {
                    if let val = value as? [String: Any] {
                        let user = KMUser()
                        user.age = val["age"]! as! Int
                        user.email = val["email"]! as! String
                        user.username = val["username"]! as! String
                        user.height = val["height"] as! Int
                        user.weight = val["weight"] as! Int
                        user.genre = val["genre"] as! String
                        user.lifetimeSteps = val["lifetimeSteps"] as! Int
                        users.append(user)
                    }
                }
                completion(users)
            }
        }
    }
}
