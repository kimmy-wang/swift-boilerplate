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
        view.tabBarItem.title = "Home"
        view.tabBarItem.image = .icon(from: .TabHome, iconColor: .lightGray, imageSize: CGSize(width: 22, height: 22), ofSize: 22)
        view.tabBarItem.selectedImage = .icon(from: .TabHomeSelected, iconColor: .blue, imageSize: CGSize(width: 22, height: 22), ofSize: 22)
        
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
