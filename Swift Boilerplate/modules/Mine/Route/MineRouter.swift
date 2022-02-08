//
//  MineRouter.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import Foundation
import UIKit

class MineRouter: MinePresenterToRouterProtocol{
    
    // MARK: - Methods
    
    class func createModule() -> UIViewController {
        
        let view = MineViewController()
        
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
