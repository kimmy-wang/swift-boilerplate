//
//  AppDelegate.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import UIKit
import SwiftTheme

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MyThemes.restoreLastTheme()

        // status bar
        UIApplication.shared.theme_setStatusBarStyle([.lightContent, .default, .lightContent, .lightContent], animated: true)

        let window = UIWindow(frame: UIScreen.main.bounds)

        Application.shared.configureMainInterface(in: window)

        self.window = window
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        MyThemes.saveLastTheme()
    }

}
