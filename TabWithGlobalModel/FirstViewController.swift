//
//  FirstViewController.swift
//  TabWithGlobalModel
//
//  Created by Wesley Sadler on 9/16/16.
//  Copyright © 2016 Digital Sadler. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setLabels()
    }

    private func setLabels() {
        
        let applicationTabBarController = tabBarController as! ApplicationTabBarController
        let model = applicationTabBarController.model
        let (item, amount) = model.getModel()
        itemLabel.text = item
        amountLabel.text = String(amount)
        
    }
}

