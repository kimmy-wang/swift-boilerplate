//
//  HomeRouter.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation
import UIKit
import RAMAnimatedTabBarController

class HomeRouter: HomePresenterToRouterProtocol{
    
    // MARK: - Methods
    
    class func createModule() -> UIViewController {
        
        let view = HomeViewController()
//        view.tabBarItem = RAMAnimatedTabBarItem()
        
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
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
