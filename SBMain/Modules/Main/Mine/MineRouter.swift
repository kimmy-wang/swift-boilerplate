//
//  MineRouter.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import Foundation
import UIKit

open class MineRouter: MinePresenterToRouterProtocol {

    // MARK: - Methods

    open class func createModule() -> UIViewController {

        let view = MineViewController()

        let presenter: MineViewToPresenterProtocol & MineInteractorToPresenterProtocol = MinePresenter()
        let router: MinePresenterToRouterProtocol = MineRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router

        return view
    }

    func presentSettingsScreen(from view: MinePresenterToViewProtocol) {
        let settingsViewController = SettingsRouter.createModule()
        if let sourceView = view as? UIViewController {
           sourceView.navigationController?.pushViewController(settingsViewController, animated: false)
        }
    }

}
