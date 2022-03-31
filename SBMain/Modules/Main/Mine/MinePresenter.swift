//
//  MinePresenter.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import Foundation

class MinePresenter: MineViewToPresenterProtocol {

    // MARK: - Properties
    weak var view: MinePresenterToViewProtocol?
    var router: MinePresenterToRouterProtocol?

    // MARK: - Methods
    func showSettingsDetail() {
        router?.presentSettingsScreen(from: view!)
    }
}

// MARK: - HomeInteractorToPresenterProtocol
extension MinePresenter: MineInteractorToPresenterProtocol {}
