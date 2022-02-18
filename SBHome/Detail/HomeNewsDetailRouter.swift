//
//  HomeNewsDetailRouter.swift
//  SBHome
//
//  Created by Ying Wang on 2022/2/17.
//

import Foundation
import UIKit
import SBCommon

open class HomeNewsDetailRouter: HomeNewsDetailPresenterToRouterProtocol {

    // MARK: - Methods

    open class func createModule(forNews news: BaseModel) -> UIViewController {

        let view = HomeNewsDetailViewController()

        let presenter: HomeNewsDetailViewToPresenterProtocol & HomeNewsDetailInteractorToPresenterProtocol = HomeNewsDetailPresenter()
        let interactor: HomeNewsDetailPresentorToInteractorProtocol = HomeNewsDetailInteractor()
        let router: HomeNewsDetailPresenterToRouterProtocol = HomeNewsDetailRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.news = news
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
