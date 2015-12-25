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
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        var tipper = 0
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("tip") != nil) {
            //if tipValue != nil {
            let defaults = NSUserDefaults.standardUserDefaults()
            let tipValue = defaults.doubleForKey("tip")
            
            if (tipValue == 0.25) {
                tipper = 2
            }
            else if (tipValue == 0.15) {
                tipper = 0
            }
            else {
                tipper = 1
            }
            println(tipper);
            tipControl.selectedSegmentIndex = tipper
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var tipper = 0
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("tip") != nil) {
            //if tipValue != nil {
            let defaults = NSUserDefaults.standardUserDefaults()
            let tipValue = defaults.doubleForKey("tip")
            
            if (tipValue == 0.25) {
                tipper = 2
            }
            else if (tipValue == 0.15) {
                tipper = 0
            }
            else {
                tipper = 1
            }
            println(tipper);
            tipControl.selectedSegmentIndex = tipper
            
            updateValues()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateValues()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateValues() {
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercent
        var total = billAmount + tip
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
        
    }
}

