//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Minh Tran on 8/21/16.
//  Copyright © 2016 Minh. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var brain: CalculatorBrain = CalculatorBrain()
    
    var userTyping: Bool = false
    
    @IBAction func digit(sender: UIButton) {
        let digit = sender.currentTitle
        if (userTyping) {
            display.text = display.text! + digit!
        }
        else {
            display.text = digit
        }
        userTyping = true
    }
    
    @IBAction func operation(sender: UIButton) {
        userTyping = false
        brain.performOperation(sender.currentTitle!, val: (Double(display.text!)!))
        let value = brain.get()
        if (value == floor(value)) {
            display.text = String(Int(value))
        }
        else {
            display.text = String(value)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

