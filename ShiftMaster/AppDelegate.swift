//
//  AppDelegate.swift
//  ShiftMaster
//
//  Created by Yair Levi on 7/25/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // Override point for customization after application launch.
        Parse.setApplicationId("itsKIXwRwRMiAwv5m5E2af0212dcFpkwgKIMidyQ", clientKey: "We6JeAi1XjI4KzUpi9GL7QLMdb5LSAhmqgjHA1qP")
        
//        var user = PFUser()
//        user.username = "lyair2"
//        user.password = "12345"
//        user.email = "email2@example.com"
//        // other fields can be set just like with PFObject
//        var workPlaces = ["microsoft","Yahoo"]
//        user["WorkPlacesArray"] = workPlaces
//        
//        user.signUpInBackgroundWithBlock {
//            (succeeded: Bool!, error: NSError!) -> Void in
//            if !error {
//                // Hooray! Let them use the app now.
//            } else {
//                let errorString = error.userInfo["error"] as NSString
//                // Show the errorString somewhere and let the user try again.
//            }
//        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

