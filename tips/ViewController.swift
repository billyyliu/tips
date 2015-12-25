//
//  ViewController.swift
//  tips
//
//  Created by Ziyan on 12/23/15.
//  Copyright © 2015 Ziyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var t1 = 10.0
    var t2 = 15.0
    var t3 = 20.0
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipContrl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view, typically from a nib.
        tipsLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(10.0, forKey: "tip1_saved")
        defaults.setDouble(15.0, forKey: "tip2_saved")
        defaults.setDouble(20.0, forKey: "tip3_saved")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tippercent = [t1/100,t2/100,t3/100]
        var tp = tippercent[tipContrl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tp
        var total = billAmount + tip
        tipsLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        t1 = defaults.doubleForKey("tip1_saved")
        t2 = defaults.doubleForKey("tip2_saved")
        t3 = defaults.doubleForKey("tip3_saved")
        tipContrl.setTitle( "\(t1)%" , forSegmentAtIndex: 0)
        tipContrl.setTitle("\(t2)%", forSegmentAtIndex: 1)
        tipContrl.setTitle("\(t3)%" , forSegmentAtIndex: 2)
        onEditingChanged(self)
    }
    
    @IBAction func ontap(sender: AnyObject) {
        view.endEditing(true)
    }
}

