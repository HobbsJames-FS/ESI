//
//  AppDelegate.swift
//  screen_2_intro_
//
//  Created by exportkit on 2023.
//  Copyright (c)  exportkit. All rights reserved.
//  Generated by Export Kit v128			
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let ek_storyboard: UIStoryboard = self.renderStoryboard()
	
        self.window?.rootViewController = ek_storyboard.instantiateInitialViewController()
        self.window?.makeKeyAndVisible()

        // Override point for customization after application launch.

        return true
    }

    func renderStoryboard() -> UIStoryboard {

        let screenWidth: Int = Int(UIScreen.main.bounds.size.width)
        let ek_storyboard: UIStoryboard

        switch screenWidth {


            default:
                ek_storyboard = UIStoryboard(name: "Main", bundle: nil)

        }

        return ek_storyboard

    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}
