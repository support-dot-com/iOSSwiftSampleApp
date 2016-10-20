//
//  LogCustomDataViewController.swift
//  SwiftSampleApp
//
//  Created by Chandan on 14/10/16.
//  Copyright © 2016 Support.com. All rights reserved.
//

import UIKit

class LogCustomDataViewController: UIViewController {
    @IBOutlet weak var deviceInfoTextView: UITextView!
    @IBOutlet weak var appInfoTextView: UITextView!
    @IBOutlet weak var deviceInfoButton: UIButton!
    @IBOutlet weak var appInfoButton: UIButton!

    @IBOutlet weak var appInfoTextFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var deviceInfoTextFieldHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logDeviceInfo(_ sender: AnyObject) {
        let dictionary = [
            "OS Version" : UIDevice.current.systemVersion,
            "Phone Model" : self.deviceName
        ] as [String : Any]
        
        (SupportcomCloudSDK.sharedInstance() as AnyObject).logDevice("IOS", withData: dictionary)
        deviceInfoTextView.isHidden = false
        self.deviceInfoTextView.text = dictionary.description
        deviceInfoButton.isHidden = true
        self.view!.layoutIfNeeded()
        self.deviceInfoTextFieldHeight.constant = 100
        UIView.animate(withDuration: 0.5, delay: 0, options: ([.curveEaseOut, .curveEaseOut]), animations: {() -> Void in
            self.view!.layoutIfNeeded()
            }, completion: {(finished: Bool) -> Void in
        })
    }

    @IBAction func logAppInfo(_ sender: AnyObject) {
        let dictionary = [
            "App Name" : "Sample App",
            "App Version" : "1.0",
            "Signed In" : "No",
            "Profiles" : "1"
        ]
        
        appInfoTextView.isHidden = false
        self.appInfoTextView.text = dictionary.description
        (SupportcomCloudSDK.sharedInstance() as AnyObject).logContent("Sample App", withData: dictionary)
        appInfoButton.isHidden = true
        self.view!.layoutIfNeeded()
        self.appInfoTextFieldHeight.constant = 100
        UIView.animate(withDuration: 0.5, delay: 0, options: ([.curveEaseOut, .curveEaseOut]), animations: {() -> Void in
            self.view!.layoutIfNeeded()
            }, completion: {(finished: Bool) -> Void in
        })
    }

    @IBAction func doneClicked(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: { _ in })
    }
    
    func deviceName() -> String {
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return NSString(bytes: &sysinfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)! as String
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
