//
//  SecondViewController.swift
//  TabWithGlobalModel
//
//  Created by Wesley Sadler on 9/16/16.
//  Copyright © 2016 Digital Sadler. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!  {
        didSet {
            itemTextField.delegate = self
        }
    }

    @IBOutlet weak var amountTextField: UITextField!  {
        didSet {
            amountTextField.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let applicationTabBarController = tabBarController as! ApplicationTabBarController
        let model = applicationTabBarController.model
        let (item, amount) = model.getModel()
        itemTextField.text = item
        amountTextField.text = String(amount)

    }

    //MARK: UITextFieldDelegate
    // Dismiss the keyboard when the user taps the "Return" key or its equivalent
    // while editing a text field.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }


    @IBAction func saveAction(sender: AnyObject) {
        let item = itemTextField.text
        let amountString = amountTextField.text
        let amount = Int(amountString!)
        let model = ApplicationModel(item: item!, amount: amount!)
        let applicationTabBarController = tabBarController as! ApplicationTabBarController
        applicationTabBarController.model = model

    }

}

