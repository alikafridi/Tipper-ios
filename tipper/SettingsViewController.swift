//
//  SettingsViewController.swift
//  
//
//  Created by Ali Afridi on 12/24/15.
//
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFromDefaults()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getFromDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipInt = Int(tipSlider.value)
        tipValue.text = "\(tipInt)"
        
        // Save value
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipInt, forKey: "tip")
        defaults.synchronize()
        
        println(tipInt)
    }
    
    func getFromDefaults() {
        if (NSUserDefaults.standardUserDefaults().objectForKey("tip") != nil) {
            
            let defaults = NSUserDefaults.standardUserDefaults()
            let tipsy = defaults.integerForKey("tip")
            println(tipsy)
            
            tipSlider.value = Float(tipsy)
        }
        var tip = Int(tipSlider.value)
        tipValue.text = String (tip)
    }
}
