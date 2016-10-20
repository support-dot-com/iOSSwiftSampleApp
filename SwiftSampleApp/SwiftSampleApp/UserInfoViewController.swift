//
//  UserInfoViewController.swift
//  SwiftSampleApp
//
//  Created by Chandan on 13/10/16.
//  Copyright © 2016 Support.com. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var externalTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneClicked(_ sender: AnyObject) {
        if((self.emailTextField.text?.characters.count)! > 0){
            (SupportcomCloudSDK.sharedInstance() as AnyObject) .setEmail(self.emailTextField.text)
        }
        if((self.firstNameTextField.text?.characters.count)! > 0){
            (SupportcomCloudSDK.sharedInstance() as AnyObject) .setFirstName(self.firstNameTextField.text)
        }
        if((self.lastNameTextField.text?.characters.count)! > 0){
            (SupportcomCloudSDK.sharedInstance() as AnyObject) .setLastName(self.lastNameTextField.text)
        }
        if((self.phoneTextField.text?.characters.count)! > 0){
            (SupportcomCloudSDK.sharedInstance() as AnyObject) .setPhone(self.phoneTextField.text)
        }
        if((self.externalTextField.text?.characters.count)! > 0){
            (SupportcomCloudSDK.sharedInstance() as AnyObject) .setExternalId(self.externalTextField.text)
        }

        self .dismiss(animated: false, completion: nil)
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
