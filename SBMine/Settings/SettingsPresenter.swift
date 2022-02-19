//
//  SettingsPresenter.swift
//  SBMine
//
//  Created by Ying Wang on 2022/2/19.
//

import Foundation

class SettingsPresenter: SettingsViewToPresenterProtocol {

    // MARK: - Properties
    weak var view: SettingsPresenterToViewProtocol?
    var router: SettingsPresenterToRouterProtocol?

    // MARK: - Methods
    func showAppearenceDetail() {
        router?.presentAppearenceScreen(from: view!)
    }
}

// MARK: - SettingsInteractorToPresenterProtocol
extension SettingsPresenter:SettingsInteractorToPresenterProtocol {}
