//
//  AppearenceRouter.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/2/19.
//

import Foundation
import UIKit

open class AppearenceRouter: AppearencePresenterToRouterProtocol {

    // MARK: - Methods

    open class func createModule() -> UIViewController {

        let view = AppearenceViewController()

        let presenter: AppearenceViewToPresenterProtocol & AppearenceInteractorToPresenterProtocol = AppearencePresenter()
        let router: AppearencePresenterToRouterProtocol = AppearenceRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router

        return view
    }

}
