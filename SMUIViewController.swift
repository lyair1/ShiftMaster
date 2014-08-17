//
//  SMUIViewController.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/2/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import UIKit

class SMUIViewController : UIViewController ,PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate
{
    var logInViewController:PFLogInViewController = PFLogInViewController()
    var signUpViewController:PFSignUpViewController = PFSignUpViewController()
    
    override func viewDidLoad() {
        view.backgroundColor = SMCommon().SMCBlueGreenJetStream
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
        if(!PFUser.currentUser()){
            logInViewController.delegate = self
            signUpViewController.delegate = self
            
            signUpViewController.fields = PFSignUpFields(PFSignUpFieldsEmail.value | PFSignUpFieldsDismissButton.value | PFSignUpFieldsUsernameAndPassword.value | PFSignUpFieldsSignUpButton.value)
            
            logInViewController.signUpController = signUpViewController
            
            logInViewController.fields = PFLogInFields(PFLogInFieldsUsernameAndPassword.value
                | PFLogInFieldsLogInButton.value
                | PFLogInFieldsSignUpButton.value
                | PFLogInFieldsPasswordForgotten.value)
            
            self.presentViewController(logInViewController, animated: true, completion: nil)
        }else{
            logInViewController(logInViewController,didLogInUser: PFUser.currentUser())
        }
    }
    
    //***************
    //Login delegates
    //***************
    
    func logInViewController(logInController: PFLogInViewController!, shouldBeginLogInWithUsername username: String!, password: String!) -> Bool {
        
        if (NSString(string: username).length != 0 && NSString(string: password).length != 0) {
            return true;
        }
        
        let alert = UIAlertController(title: "Missing Information", message: "Make sure you fill out all of the information!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        return false; // Interrupt login process
    }

    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        logInViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController!, didFailToLogInWithError error: NSError!) {
        NSLog("Login failed with errors",[])
    }

    func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController!) {
        NSLog("User dissmissed login view",[])
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, shouldBeginSignUp info: [NSObject : AnyObject]!) -> Bool {
        
        var informationComplete = true;
        
        //loop through all of the submitted data
        for (key) in (info) {
            var field:String = key.1 as NSString
            if (NSString(string: field).length == 0) { // check completion
                informationComplete = false;
                break;
            }
        }
        
        // Display an alert if a field wasn't completed
        let alert = UIAlertController(title: "Missing Information", message: "Make sure you fill out all of the information!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
    
        return informationComplete;
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didFailToSignUpWithError error: NSError!) {
        NSLog("Signup failed with errors",[])
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didSignUpUser user: PFUser!) {
        logInViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController!){
        NSLog("User dissmissed signup view",[])
    }
}