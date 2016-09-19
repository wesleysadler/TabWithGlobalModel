//
//  ApplicationUserDefaults.swift
//  TabWithGlobalModel
//
//  Created by Wesley Sadler on 9/19/16.
//  Copyright © 2016 Digital Sadler. All rights reserved.
//

import Foundation

class ApplicationUserDefaults: NSObject, NSCoding {
    
    var item: String!
    var amount: Int!
    
    override var description: String {
        return "Item \(item) amount \(amount)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        item = aDecoder.decodeObjectForKey("item") as! String
        amount = aDecoder.decodeObjectForKey("amount") as! Int
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(item, forKey: "item")
        aCoder.encodeObject(amount, forKey: "amount")
    }
    
    override init() {
        super.init()
    }
    
    init(item: String, amount: Int) {
        self.item = item
        self.amount = amount
        super.init()
    }
    
}
