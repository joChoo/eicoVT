//
//  AppDelegate.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 01/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts


let appD = UIApplication.shared.delegate as! AppDelegate

var connectedUser:PFUser?
var currentEntity:PFObject?
var currentTeam:PFObject?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
       
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        let configuration = ParseClientConfiguration {
            $0.applicationId = "wjH622Eya7e7gKt4Q0MPoNlpRYSpChYFWSFTBgtl"
            $0.clientKey = "6yFFsCFTrRPWkPLoHu7WAASoVoTZsww1ujc1Bs1V"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        checkStoryboardMode()
        PFTeam.registerSubclass()
            
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
    
    func checkStoryboardMode(){
        if (PFUser.current() == nil) {
            enterLoginMode()
        }
        else {
            exitLoginMode()
        }
    }
    
    
    func enterLoginMode(){
        
        connectedUser = nil
        let storyboard = UIStoryboard(name: "UnauthorizedUser", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "ViewControllerLogin") as! ViewControllerLogin
        
        
        appD.window!.rootViewController = loginVC
        
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func exitLoginMode(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let appD = UIApplication.shared.delegate as! AppDelegate
        
        appD.window!.rootViewController = storyboard.instantiateInitialViewController()
        
    }

}

