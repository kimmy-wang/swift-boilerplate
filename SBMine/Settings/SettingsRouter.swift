//
//  SettingsRouter.swift
//  SBMine
//
//  Created by Ying Wang on 2022/2/19.
//

import Foundation
import UIKit
import SBTheme

open class SettingsRouter: SettingsPresenterToRouterProtocol {

    // MARK: - Methods

    open class func createModule() -> UIViewController {

        let view = SettingsViewController()

        let presenter: SettingsViewToPresenterProtocol & SettingsInteractorToPresenterProtocol = SettingsPresenter()
        let router: SettingsPresenterToRouterProtocol = SettingsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router

        return view
    }

    func presentAppearenceScreen(from view: SettingsPresenterToViewProtocol) {
        let appearenceViewController = AppearenceRouter.createModule()
        if let sourceView = view as? UIViewController {
           sourceView.navigationController?.pushViewController(appearenceViewController, animated: false)
        }
    }

}
