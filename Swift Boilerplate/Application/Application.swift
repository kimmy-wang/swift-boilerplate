//
//  Application.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/16.
//

import Foundation
import AlamofireNetworkActivityIndicator
import RAMAnimatedTabBarController

final class Application {

    static let shared = Application()

    private init() {}

    func configureMainInterface(in window: UIWindow) {
        NetworkActivityIndicatorManager.shared.isEnabled = true

        let news = HomeRouter.createModule()
        let mine = MineRouter.createModule()

        let newsNav = UINavigationController(rootViewController: news)
        let mineNav = UINavigationController(rootViewController: mine)

        let tabBarController = RAMAnimatedTabBarController()
        tabBarController.viewControllers = [newsNav, mineNav]

        window.rootViewController = tabBarController
    }
}
