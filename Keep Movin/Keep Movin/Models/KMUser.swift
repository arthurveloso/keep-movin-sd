//
//  KMUser.swift
//  Keep Movin
//
//  Created by Arthur Veloso Gouveia de Melo on 21/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import Foundation

class KMUser: NSObject {
    var username: String = ""
    var age: Int = 0
    var email: String = ""
    var genre: String = ""
    var height: Int = 0
    var weight: Int = 0
    var uid: String = ""
    var lifetimeSteps: Int = 0
    
    init(dic: [String:Any]) {
        super.init()
        super.setValuesForKeys(dic)
    }
    
    override init() {
        super.init()
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
}
