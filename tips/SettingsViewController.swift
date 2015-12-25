//
//  SettingsViewController.swift
//  tips
//
//  Created by Ziyan on 12/25/15.
//  Copyright © 2015 Ziyan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var Tip1: UITextField!
    @IBOutlet weak var Tip2: UITextField!
    @IBOutlet weak var Tip3: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tip1Changed(sender: AnyObject) {
        var tip1Amount = NSString(string: Tip1.text!).doubleValue
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tip1Amount, forKey: "tip1_saved")
        defaults.synchronize()
    }
    @IBAction func tip2Changed(sender: AnyObject) {
        var tip2Amount = NSString(string: Tip2.text!).doubleValue
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tip2Amount, forKey: "tip2_saved")
        defaults.synchronize()
    }
    @IBAction func tip3Changed(sender: AnyObject) {
        var tip3Amount = NSString(string: Tip3.text!).doubleValue
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tip3Amount, forKey: "tip3_saved")
        defaults.synchronize()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let tt1 = defaults.doubleForKey("tip1_saved")
        let tt2 = defaults.doubleForKey("tip2_saved")
        let tt3 = defaults.doubleForKey("tip3_saved")
        Tip1.text = "\(tt1)"
        Tip2.text = "\(tt2)"
        Tip3.text = "\(tt3)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
