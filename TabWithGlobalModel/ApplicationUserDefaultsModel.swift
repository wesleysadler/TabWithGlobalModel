//
//  ApplicationUserDefaultsModel.swift
//  TabWithGlobalModel
//
//  Created by Wesley Sadler on 9/19/16.
//  Copyright © 2016 Digital Sadler. All rights reserved.
//

import Foundation

private let kApplicationUserDefaultsKey: String =  "tabApplicationKey"

class ApplicationUserDefaultsModel {
    
    class func userDefaults() -> ApplicationModel {
        
        let data: NSData? = NSUserDefaults.standardUserDefaults().objectForKey(kApplicationUserDefaultsKey) as? NSData
        // check if user defaults exist and get version
        if (data != nil)  {
            
            let applicationUserDefaultsObject: AnyObject! = NSKeyedUnarchiver.unarchiveObjectWithData(data!)
            let applicationUserDefaults: ApplicationUserDefaults = applicationUserDefaultsObject as! ApplicationUserDefaults
            let applicationModel = ApplicationModel(item: applicationUserDefaults.item, amount: applicationUserDefaults.amount)
            return applicationModel
            
        } else {
            
            let applicationModel = ApplicationModel(item: "Item", amount: 1)
            return applicationModel

        }

    }
    
    class func saveUserDefaults(applicationModel: ApplicationModel) -> Bool {
        
        let (item, amount) = applicationModel.getModel()
        let applicationUserDefaults: ApplicationUserDefaults = ApplicationUserDefaults(item: item, amount: amount)
       
        NSUserDefaults.standardUserDefaults().setObject((NSKeyedArchiver.archivedDataWithRootObject(applicationUserDefaults)), forKey: kApplicationUserDefaultsKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        return true
    }
    
}