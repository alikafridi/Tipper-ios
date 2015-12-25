//
//  SettingsViewController.swift
//  
//
//  Created by Ali Afridi on 12/24/15.
//
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            defaultTipControl.selectedSegmentIndex = tipper
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.2, 0.25]
        var tip = tipPercentages[defaultTipControl.selectedSegmentIndex]
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setDouble(tip, forKey: "tip")
        defaults.synchronize()
    }
}
