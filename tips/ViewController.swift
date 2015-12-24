//
//  ViewController.swift
//  tips
//
//  Created by Richard Rolle on 11/24/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var intValue = -1
    
    var lowestTip = 0
    
    var highestTip = 0
    
    var midTip = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        lowestTip = userDefaults.integerForKey("lowest_tip")
        midTip = userDefaults.integerForKey("mid_tip")
        highestTip = userDefaults.integerForKey("highest_tip")
        
        tipControl.setTitle("\(lowestTip)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(midTip)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(highestTip)%", forSegmentAtIndex: 2)
        userDefaults.synchronize()
        
        //        defaultTipControl.selectedSegmentIndex = userDefaults.integerForKey("default_tip")
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        userDefaults.setInteger(lowestTip, forKey: "lowest_tip")
        userDefaults.setInteger(midTip, forKey: "mid_tip")
        userDefaults.setInteger(highestTip, forKey: "highest_tip")
        userDefaults.synchronize()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var tipPercentage = 0.0
//        print(tipControl.selectedSegmentIndex)
        if (tipControl.selectedSegmentIndex == 0){
            tipPercentage = Double(userDefaults.integerForKey("lowest_tip")) / 100.0
        }
        if (tipControl.selectedSegmentIndex == 1) {
            tipPercentage = Double(userDefaults.integerForKey("mid_tip")) / 100.0
        }
        if (tipControl.selectedSegmentIndex == 2) {
            tipPercentage = Double(userDefaults.integerForKey("highest_tip")) / 100.0
        }
        
//        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

