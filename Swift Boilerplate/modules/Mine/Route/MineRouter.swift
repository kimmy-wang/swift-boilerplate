//
//  MineRouter.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import Foundation
import UIKit
import RAMAnimatedTabBarController

class MineRouter: MinePresenterToRouterProtocol{
    
    // MARK: - Methods
    
    class func createModule() -> UIViewController {
        
        let view = MineViewController()
//        view.tabBarItem = RAMAnimatedTabBarItem()
        view.tabBarItem.title = "Mine"
        view.tabBarItem.image = .icon(from: .TabMine, iconColor: .lightGray, imageSize: CGSize(width: 22, height: 22), ofSize: 22)
        view.tabBarItem.selectedImage = .icon(from: .TabMineSelected, iconColor: .blue, imageSize: CGSize(width: 22, height: 22), ofSize: 22)
        
        let presenter: MineViewToPresenterProtocol & MineInteractorToPresenterProtocol = MinePresenter()
        let interactor: MinePresentorToInteractorProtocol = MineInteractor()
        let router: MinePresenterToRouterProtocol = MineRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
}
