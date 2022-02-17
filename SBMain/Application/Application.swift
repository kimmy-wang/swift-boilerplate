//
//  Application.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/16.
//

import Foundation
import AlamofireNetworkActivityIndicator
import RAMAnimatedTabBarController
import SBHome
import SBMine

final class Application {

    static let shared = Application()

    private init() {}

    func configureMainInterface(in window: UIWindow) {
        NetworkActivityIndicatorManager.shared.isEnabled = true

        let home = HomeRouter.createModule()
        let mine = MineRouter.createModule()

        let homeNav = UINavigationController(rootViewController: home)
        let mineNav = UINavigationController(rootViewController: mine)

        let tabBarController = RAMAnimatedTabBarController()
        tabBarController.viewControllers = [homeNav, mineNav]

        window.rootViewController = tabBarController
    }
}
