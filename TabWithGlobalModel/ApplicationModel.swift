//
//  ApplicationModel.swift
//  TabWithGlobalModel
//
//  Created by Wesley Sadler on 9/19/16.
//  Copyright © 2016 Digital Sadler. All rights reserved.
//

import Foundation

class ApplicationModel: CustomStringConvertible {
    
    private var item: String!
    private var amount: Int!
    
    var description: String {
        return "Item \(item) Amount \(amount)"
    }
    
    init(item: String, amount: Int) {
        self.item = item
        self.amount = amount
    }
    
    func getModel() -> (item: String, amount: Int) {
        return (self.item, self.amount)
    }
    
}