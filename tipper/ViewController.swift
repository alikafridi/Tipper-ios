//
//  ViewController.swift
//  tipper
//
//  Created by Ali Afridi on 12/24/15.
//  Copyright (c) 2015 Ali Afridi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        getFromDefaults()
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getFromDefaults()
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateValues()
    }

    @IBAction func onTap(sender: AnyObject) {
        //view.endEditing(true)
    }
    
    func getFromDefaults() {
        if (NSUserDefaults.standardUserDefaults().objectForKey("tip") != nil) {
            let defaults = NSUserDefaults.standardUserDefaults()
            let tip = defaults.integerForKey("tip")
            println(tip)
            
            tipSlider.value = Float(tip)
            
            updateValues()
        }
    }
    
    func updateValues() {
        var tipInt = Int(tipSlider.value)
        var tipDouble = Double (tipInt)
        var tipPercent = tipDouble/100
        var billAmount = NSString(string: billField.text!).doubleValue
        println("tip percent: \(tipPercent)")
        
        var tip = billAmount * tipPercent
        var total = billAmount + tip
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
        
        var tipsy = Int(tipSlider.value)
        tipValue.text = "\(tipsy) %"
        
        println(tipsy)
    }
    
}

