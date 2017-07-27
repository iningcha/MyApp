//
//  AppDelegate.swift
//  MyApp
//
//  Created by ChangSamantha on 7/19/17.
//  Copyright © 2017 Chang Samantha. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        
        if UserDefaults.standard.value(forKey: "Music") == nil {
            UserDefaults.standard.set([[String:Any]](), forKey: Category.Music.rawValue)
            UserDefaults.standard.set([[String:Any]](), forKey: Category.Books.rawValue)
            UserDefaults.standard.set([[String:Any]](), forKey: Category.TV.rawValue)
            UserDefaults.standard.synchronize()
        }

//        let defaultImage = UIImage(imageLiteralResourceName: "default")
//        let data = UIImagePNGRepresentation(defaultImage)
//        
//        var documentsUrl = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first!
//        documentsUrl.appendPathComponent("test.png", isDirectory: false)
        
        
//        /Users/SamanthaChang/Library/Developer/CoreSimulator/Devices/B1DC04C4-9636-44E4-B419-E0788AB4334E/data/Containers/Data/Application/EF761866-4ADE-4625-B295-240D79C7FA79/Documents/
//        /Users/SamanthaChang/Library/Developer/CoreSimulator/Devices/B1DC04C4-9636-44E4-B419-E0788AB4334E/data/Containers/Data/Application/EF761866-4ADE-4625-B295-240D79C7FA79/Documents/test.png
        
        //path /Users/grady/document/ -> file:///Users/grady/
        
        //URL  http://www.google.com/content?key=value
        //scheme http/https/file://
        //host www.google.com
        //path /content/description
        //query ?key=value
        
        
//        try? data?.write(to: documentsUrl)
        
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
    
//    func test(){
//        
//        let favoriteViewController = FavoriteTableViewController(style: .plain)
//        let navigationController = UINavigationController(rootViewController: favoriteViewController)
//        
//        
//        let viewController = UIViewController()
//        viewController.view.backgroundColor = UIColor.red
//        navigationController.pushViewController(viewController, animated: true)
//        
//        
//    }

}

