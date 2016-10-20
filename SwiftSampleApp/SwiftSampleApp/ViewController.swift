//
//  ViewController.swift
//  SwiftSampleApp
//
//  Created by Chandan on 12/10/16.
//  Copyright © 2016 Support.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SupportcomCloudDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connectToAgent(_ sender: AnyObject) {
        (SupportcomCloudSDK.sharedInstance() as AnyObject).connectToAgent();
    }
    
    @IBAction func showLivehelp(_ sender: AnyObject) {
        (SupportcomCloudSDK.sharedInstance() as AnyObject).showLiveHelp();
    }
    
    @IBAction func showHelpWithTag(_ sender: AnyObject) {
        (SupportcomCloudSDK.sharedInstance() as AnyObject).showSelfHelp(forTags: (NSArray(objects:"lightbulb","thermostat") as [AnyObject]));
    }
    
    @IBAction func showHelpWithId(_ sender: AnyObject) {
        (SupportcomCloudSDK.sharedInstance() as AnyObject).showSelfHelp(forId: "lightbulb", withDisplayOrder: (NSArray(objects:"paths") as [AnyObject]), on: nil);
    }

    @IBAction func showUserInfo(_ sender: AnyObject) {
        self .performSegue(withIdentifier: "showUserInfo", sender: self)
    }

    @IBAction func showLogData(_ sender: AnyObject) {
        self .performSegue(withIdentifier: "showLogData", sender: self)
    }

    func didReceiveSDKInitilizationError(forReason error: String) {
        // Error handling to disable/hide getHelp button.
    }

}

