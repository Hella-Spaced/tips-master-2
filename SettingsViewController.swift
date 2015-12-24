//
//  SettingsViewController.swift
//  tips
//
//  Created by Richard Rolle on 12/5/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    var lowestTip = 0
    var midTip = 0
    var highestTip = 0
    let userDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    
    @IBOutlet weak var defaultField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        lowestTip = userDefaults.integerForKey("lowest_tip")
        midTip = userDefaults.integerForKey("mid_tip")
        highestTip = userDefaults.integerForKey("highest_tip")
        
        defaultTipControl.setTitle("\(lowestTip)", forSegmentAtIndex: 0)
        defaultTipControl.setTitle("\(midTip)", forSegmentAtIndex: 1)
        defaultTipControl.setTitle("\(highestTip)", forSegmentAtIndex: 2)
        userDefaults.synchronize()
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    
        
        userDefaults.setInteger(lowestTip, forKey: "lowest_tip")
        userDefaults.setInteger(midTip, forKey: "mid_tip")
        userDefaults.setInteger(highestTip, forKey: "highest_tip")
        userDefaults.synchronize()
    }

    @IBAction func onDefaultChanged(sender: AnyObject) {
    
        
        
        
        
        if defaultTipControl.selectedSegmentIndex == 0 {
            defaultField.text = "\(lowestTip)"
        }
        if defaultTipControl.selectedSegmentIndex == 1 {
            defaultField.text = "\(midTip)"
        }
        if defaultTipControl.selectedSegmentIndex == 2 {
            defaultField.text = "\(highestTip)"
        }

    
        
        print(userDefaults.integerForKey("default_tip"))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    

        
        
    }
    
    @IBAction func defaultInputTyped(sender: AnyObject) {
        print(defaultField.text)
        
        
        if defaultTipControl.selectedSegmentIndex == 0 {
            lowestTip = (NSString(string: defaultField.text!).integerValue)
        }
        if defaultTipControl.selectedSegmentIndex == 1 {
            midTip = NSString(string: defaultField.text!).integerValue
        }
        if defaultTipControl.selectedSegmentIndex == 2 {
            highestTip = NSString(string: defaultField.text!).integerValue
        }
       
        defaultTipControl.setTitle(defaultField.text, forSegmentAtIndex: defaultTipControl.selectedSegmentIndex)
        
    
        

    }

//    }
    /*
    // MARK: - Navigation

    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}