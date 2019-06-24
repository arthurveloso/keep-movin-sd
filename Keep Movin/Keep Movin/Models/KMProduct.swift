//
//  KMProduct.swift
//  Keep Movin
//
//  Created by Arthur Melo on 24/06/19.
//  Copyright © 2019 Keep Movin'. All rights reserved.
//

import Foundation

class KMProduct: NSObject {
    var storeName: String = ""
    var productDesc: String = ""
    var productImgUrl: String = ""
    var storeImgUrl: String = ""

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
