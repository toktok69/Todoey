//
//  AppDelegate.swift
//  Todoey
//
//  Created by Thomas Chan on 30/11/2019.
//  Copyright © 2019 Thomas Chan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      //this gets called when the app gets loaded up. Even before viewdidload
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String) //the path of our p-list where User default is stored
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        //Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interrruptions (e.g. incoming phone call) or when user quits the app and it begins the transition to background state
        //use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Game should use this method to pause the game.
        
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //use this method to release shared resources, save user data, invalidate timers, store enough application state information to restore the app to its current state in case it's terminated later
        // if the app supports background execution, this methid is called instead of applicationWillTerminate: when the user quits
        print("AppDidenterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //Called as part of the transition from the background to the active state; here can undo mamy of the changes made on entering the background
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //Restart any tasks that were pause while the app was inactive. If the app was previously in the background, optionally refresh the user interface
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        //called when u force quit the app
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

