//
//  AppDelegate.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import UIKit
import RAMAnimatedTabBarController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let news = HomeRouter.createModule()
        let mine = MineRouter.createModule()
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [news, mine]
        tabBarController.delegate = self
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }


}

