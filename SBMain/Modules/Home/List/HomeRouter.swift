//
//  HomeRouter.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation
import UIKit

open class HomeRouter: HomePresenterToRouterProtocol {

    // MARK: - Methods

    open class func createModule() -> UIViewController {

        let view = HomeViewController()

        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresentorToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = HomeRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    func presentNewsDetailScreen(from view: HomePresenterToViewProtocol, forNews news: BaseModel) {
        let newsDetailViewController = HomeNewsDetailRouter.createModule(forNews: news)
   
        if let sourceView = view as? UIViewController {
           sourceView.navigationController?.pushViewController(newsDetailViewController, animated: false)
        }
    }
}
